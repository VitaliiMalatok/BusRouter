package dao.services;

import dao.jdbc.RouteDAO;
import dao.jdbc.StationDAO;
import dao.model.Route;
import dao.model.Station;

public class RouteService {
    public Route getRouteById(int id){

    Route route = new Route();
    RouteDAO routeDAO = new RouteDAO();
    StationDAO stationDAO = new StationDAO();
    route = routeDAO.getEntityById(id);
    Station stationStart = stationDAO.getStationStartByRouteId(id);
    Station stationFinish = stationDAO.getStationFinishByRouteId(id);
    route.setStationStart(stationStart);
    route.setStationFinish(stationFinish);
    route.setDistance(Route.calcDistance(stationStart,stationFinish));
    return route;

    }

}
