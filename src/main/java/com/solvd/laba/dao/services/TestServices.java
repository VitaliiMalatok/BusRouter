package com.solvd.laba.dao.services;

import com.solvd.laba.dao.connection.ConnectionPool;
import com.solvd.laba.dao.impl.BusDAO;
import com.solvd.laba.dao.impl.RouteDAO;
import com.solvd.laba.dao.impl.StationDAO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TestServices {

    private static final Logger LOGGER = LogManager.getLogger(TestServices.class);

    public static void main(String[] args) {
        ConnectionPool connectionPool = ConnectionPool.getInstance();
        connectionPool.init();
        BusDAO busDAO = new BusDAO();
        busDAO.getEntityById(2);
        StationDAO stationDAO = new StationDAO();
        RouteDAO routeDAO = new RouteDAO();
        StationService stationService = new StationService();

        RouteService routeService = new RouteService();

        LOGGER.info(stationService.getStationById(22));

        //LOGGER.info(routeDAO.getEntityById(22));
        LOGGER.info(routeService.getRouteById(22));

    }
}