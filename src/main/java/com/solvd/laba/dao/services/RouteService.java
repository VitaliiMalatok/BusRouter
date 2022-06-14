package com.solvd.laba.dao.services;

import com.solvd.laba.dao.impl.RouteDAO;
import com.solvd.laba.dao.impl.StationDAO;
import com.solvd.laba.dao.model.Route;
import com.solvd.laba.dao.model.Station;

public class RouteService {
    public Route getRouteById(int id) {

        RouteDAO routeDAO = new RouteDAO();
        StationDAO stationDAO = new StationDAO();
        Route route = routeDAO.getEntityById(id);
        Station stationStart = stationDAO.getStationStartByRouteId(id);
        Station stationFinish = stationDAO.getStationFinishByRouteId(id);
        route.setStationStart(stationStart);
        route.setStationFinish(stationFinish);
        route.setDistance(Route.calcDistance(stationStart, stationFinish));
        return route;
    }
}
