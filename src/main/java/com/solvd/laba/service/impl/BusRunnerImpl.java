package com.solvd.laba.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.laba.service.IBusRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BusRunnerImpl implements IBusRunner {
    private static final Logger LOGGER = LogManager.getLogger(BusRunnerImpl.class);
    //public static Station stationStart;
    //public static Station stationFinish;

    @Override
    public void programRunner() {
        //IStationDAO stationDAO = new StationDAO();
        LOGGER.info("All available stations: ");
        //List<Station> stations = stationDAO.getAll();
        //LOGGER.info(stations);
        //getAllDataFromUser(stations.size()-1);
        findShortestRoute();
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

    public static void getAllDataFromUser(int max) {
        LOGGER.info("Enter the START bus stop (ID): ");
        int startID = userInputIndex(max);
        //stationStart = stationDAO.getEntityById(startID);
        //LOGGER.info("Your START bus stop name: " + stationStart.getName() + ".");

        LOGGER.info("Enter the FINISH bus stop (ID): ");
        int finishID = userInputIndex(max);
        //stationFinish = stationDAO.getEntityById(finishID);
        //LOGGER.info("Your FINISH bus stop name: " + stationFinish.getName() + ".");
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
