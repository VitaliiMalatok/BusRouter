package com.solvd.laba.services;

import com.solvd.laba.dao.impl.RouteDAO;
import com.solvd.laba.dao.impl.StationDAO;
import com.solvd.laba.dao.model.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class RouteService {
    public Route getRouteById(int id) {

        RouteDAO routeDAO = new RouteDAO();
        StationDAO stationDAO = new StationDAO();
        StationService stationService = new StationService();
        Route route = routeDAO.getEntityById(id);
        Station stationStart = stationDAO.getStationStartByRouteId(id);
        stationStart = stationService.getStationById(stationStart.getId());
        Station stationFinish = stationDAO.getStationFinishByRouteId(id);
        stationFinish = stationService.getStationById(stationFinish.getId());
        route.setStationStart(stationStart);
        route.setStationFinish(stationFinish);
        route.setDistance(Route.calcDistance(stationStart, stationFinish));
        routeDAO.updateEntity(route);
        return route;
    }

    public static BuiltRoute getRouteInstructions(List<Station> stations) {
        BuiltRoute result = new BuiltRoute();

        System.out.println("Get to Station " + stations.get(0).getName() + " in city " + stations.get(0).getCity());
        int stationIndex = 0;
        for (int i = 0; i < stations.size(); i++) {
            i = stationIndex;
            Station station = stations.get(i);
            List<Bus> buses = station.getBuses();
            int weight = 0;
            String busName;
            for (Bus bus : buses) {
                int currentW = 0;
                String currentBusName = bus.getNumber();
                List<Station> nextStations = stations.subList(stationIndex + 1, stations.size());
                for (Station nextStation : nextStations) {
                    Set<String> busesNames = new HashSet<>();
                    for (Bus b : nextStation.getBuses()) {
                        busesNames.add(b.getNumber());
                    }
                    if (busesNames.contains(currentBusName)) {
                        currentW++;
                    } else {
                        break;
                    }
                }
                if (currentW > weight) {
                    weight = currentW;
                    busName = currentBusName;
                    stationIndex = weight + stationIndex;
                    Station toStation = stations.get(stationIndex);
                    System.out.println("User should pick bus with name " + busName + " from Station " + station.getName() + " to Station " + toStation.getName() + " in City " + stations.get(stationIndex).getCity());
                    RouteUnit currentRouteUnit = new RouteUnit(station, toStation, bus);
                    if (result.getRouteUnits() == null) {
                        result.setRouteUnits(new ArrayList<>());
                    }
                    result.getRouteUnits().add(currentRouteUnit);
                    if (stationIndex == stations.size() - 1) {
                        return result;
                    }
                }
            }
        }
        return result;
    }
}
