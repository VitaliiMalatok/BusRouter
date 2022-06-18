package com.solvd.laba.services.impl;

import com.solvd.laba.dao.impl.RouteDAO;
import com.solvd.laba.dao.impl.StationDAO;
import com.solvd.laba.dao.model.*;
import com.solvd.laba.services.IBusRunner;
import com.solvd.laba.services.RouteService;
import com.solvd.laba.services.StationService;
import com.solvd.laba.utils.FileUtils;
import com.solvd.laba.utils.ParserUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BusRunnerImpl implements IBusRunner {
    private static final Logger LOGGER = LogManager.getLogger(BusRunnerImpl.class);

    @Override
    public void programRunner() {
        StationDAO stationDAO = new StationDAO();
        RouteDAO routeDAO = new RouteDAO();
        Station start;
        Station finish;
        LOGGER.info("All available stations: ");
        StationService stationService = new StationService();
        List<Station> stationList = stationDAO.getAllStations();
        List<Station> stations = new ArrayList<>();
        List<Route> routes = routeDAO.getAllRoutes();
        for (int i = 1; i <= stationList.size(); i++) {
            stations.add(stationService.getStationById(i));
        }
        for (Station station : stations) {
            LOGGER.info(station);
        }

        LOGGER.info("Enter the START bus stop (ID): ");
        int startID = userInputIndex(stations.size());
        start = stationService.getStationById(startID);
        LOGGER.info("Your START bus stop name: " + start.getName() + ", " + start.getCity() + ".");

        LOGGER.info("Enter the FINISH bus stop (ID): ");
        int finishID = userInputIndex(stations.size());
        finish = stationService.getStationById(finishID);
        LOGGER.info("Your FINISH bus stop name: " + finish.getName() + ", " + finish.getCity() + ".");
        List<Route> fullRoutes = setDistances(routes);

        findShortestRoute(startID, finishID);
    }

    public static int userInputIndex(int max) {
        while (true) {
            Scanner in = new Scanner(System.in);
            int index = Integer.parseInt(in.next());
            if (index > max || index < 1) {
                LOGGER.info("Please enter the correct station ID (from 1 to " + max + ").");
            } else {
                return index;
            }
        }
    }

    public static List<Route> setDistances(List<Route> routes) {
        RouteService routeService = new RouteService();
        List<Route> fullRoutes = new ArrayList<>();
        for (Route route : routes) {
            fullRoutes.add(routeService.getRouteById(route.getId()));
        }
        LOGGER.info("Data of routes have been updated.");
        return fullRoutes;
    }

    public static void findShortestRoute(int start, int finish) {

        NewGraph g = new NewGraph();
        StationDAO stationDAO = new StationDAO();
        RouteDAO routeDAO = new RouteDAO();
        List<Station> stationList = stationDAO.getAllStations();

        for (Station station : stationList) {
            List<Route> routes = routeDAO.getAllNeighborsById(station.getId());
            List<Vertex> vertices = new ArrayList<>();
            for (Route route : routes) {
                vertices.add(new Vertex(route.getStationFinish().getId(), route.getDistance()));
            }
            g.addVertex(station.getId(), vertices);
        }

        List<Integer> result = g.getShortestPath(start, finish);

        StationService stationService = new StationService();
        List<Station> stations = new ArrayList<>();
        stations.add(stationService.getStationById(start));
        LOGGER.info(stationService.getStationById(start));
        for (int i = result.size() - 1; i >= 0; i--) {
            stations.add(stationService.getStationById(result.get(i)));
            LOGGER.info(stationService.getStationById(result.get(i)));
        }

        BuiltRoute builtRoute = RouteService.getRouteInstructions(stations);

        File xmlFile = FileUtils.createDefaultRouteFile(FileUtils.FileType.XML);
        ParserUtils.writeXml(builtRoute, xmlFile);

        File jsonFile = FileUtils.createDefaultRouteFile(FileUtils.FileType.JSON);
        ParserUtils.writeJson(builtRoute, jsonFile);

    }
}