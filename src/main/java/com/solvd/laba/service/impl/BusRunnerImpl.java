package com.solvd.laba.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.laba.service.IBusRunner;

import java.util.Scanner;

public class BusRunnerImpl implements IBusRunner {
    private static final Logger LOGGER = LogManager.getLogger(BusRunnerImpl.class);

    @Override
    public void programRunner() {
        //IStationDAO stationDAO = new StationDAO();
        //
        LOGGER.info("All available stations: ");
        //List<Station> stations = stationDAO.getAll();
        LOGGER.info("Enter the bus stop(ID) you are going to: ");

        //Station stationA = stationDAO.getEntityById(userInputIndex());
        if (stationA != null) {
            stationA = userInputIndex();
        } else {
            LOGGER.info("");
        }
        LOGGER.info("Enter the bus stop(ID) you are going to: ");

        //Station stationB = stationDAO.getEntityById(userInputIndex());
        if (stationB != null) {
            stationB = userInputIndex();
        } else {
            LOGGER.info("");
        }
        userInputIndex();
    }

    public Integer userInputIndex() {
        Scanner in = new Scanner(System.in);
        Integer massage = Integer.valueOf(in.next());
        LOGGER.info(">>> " + "you choice ID station: " + massage);
        return massage;
    }
}
