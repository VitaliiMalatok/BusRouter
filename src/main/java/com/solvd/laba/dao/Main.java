package dao;

import dao.ConnectionPool;
import dao.jdbc.BusDAO;
import dao.jdbc.RouteDAO;
import dao.jdbc.StationDAO;
import dao.services.RouteService;
import dao.services.StationService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Main {

    private static final Logger LOGGER = LogManager.getLogger();

    public static void main(String[] args){
        ConnectionPool connectionPool = ConnectionPool.getInstance();
        connectionPool.init();
        BusDAO busDAO = new BusDAO();
        busDAO.getEntityById(2);
        StationDAO stationDAO = new StationDAO();
        RouteDAO routeDAO = new RouteDAO();
        StationService stationService = new StationService();

        RouteService routeService = new RouteService();

        System.out.println(stationDAO.getEntityById(22));
        System.out.println(stationService.getStationById(22));
        System.out.println(routeDAO.getEntityById(22));
        System.out.println(routeService.getRouteById(22));


    }
}