package com.solvd.laba.service.impl;

import com.solvd.laba.dao.connection.ConnectionPool;
import com.solvd.laba.dao.impl.RouteDAO;
import com.solvd.laba.dao.impl.StationDAO;
import com.solvd.laba.dao.interfaces.IRouteDAO;
import com.solvd.laba.dao.interfaces.IStationDAO;
import com.solvd.laba.dao.model.Route;
import com.solvd.laba.dao.model.Station;
import com.solvd.laba.dao.services.RouteService;
import com.solvd.laba.dao.services.StationService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.laba.service.IBusRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BusRunnerImpl implements IBusRunner {
    private static final Logger LOGGER = LogManager.getLogger(BusRunnerImpl.class);
    public static Station stationStart;
    public static Station stationFinish;

    @Override
    public void programRunner() {
        ConnectionPool connectionPool = ConnectionPool.getInstance();
        connectionPool.init();
        IStationDAO stationDAO = new StationDAO();
        IRouteDAO routeDAO = new RouteDAO();
        LOGGER.info("All available stations: ");
        StationService stationService = new StationService();
        List<Station> stations = new ArrayList<>();
        List<Route> routes = routeDAO.getAllRoutes();
        for (int i = 1; i < 42; i++) {
            stations.add(stationService.getStationById(i));
        }
        for(Station station : stations){
            LOGGER.info(station);
        }
        getAllDataFromUser(stations.size(), stationDAO);
        setDistances(routes.size());
        //findShortestRoute();
    }

    public static int userInputIndex(int max) {
        while(true) {
            Scanner in = new Scanner(System.in);
            int index = Integer.parseInt(in.next());
            if(index > max || index < 1) {
                LOGGER.info("Please enter the correct station ID (from 1 to " + max + ").");
            } else {
                return index;
            }
        }
    }

    public static void getAllDataFromUser(int max, IStationDAO stationDAO) {
        LOGGER.info("Enter the START bus stop (ID): ");
        int startID = userInputIndex(max);
        stationStart = stationDAO.getEntityById(startID);
        LOGGER.info("Your START bus stop name: " + stationStart.getName() + ", " + stationStart.getCity() + ".");

        LOGGER.info("Enter the FINISH bus stop (ID): ");
        int finishID = userInputIndex(max);
        stationFinish = stationDAO.getEntityById(finishID);
        LOGGER.info("Your FINISH bus stop name: " + stationFinish.getName() + ", " + stationFinish.getCity() + ".");
    }

    public static void setDistances(int maxIndex) {
        RouteService routeService = new RouteService();
        for (int i = 1; i <= maxIndex; i++){
            Route r = routeService.getRouteById(i);
        }
        LOGGER.info("Data of routes have been updated.");
    }

    public static void findShortestRoute(){
        /*Graph graph = new Graph();
        Graph.calculateShortestPathFromSource(graph, stationStart);
        stationFinish.getShortestPath().add(stationFinish);
        List<Station> stationsResult = stationFinish.getShortestPath();
        BusService service = new BusService();
        service.getRouteInstructions(stationsResult);*/
    }
}
