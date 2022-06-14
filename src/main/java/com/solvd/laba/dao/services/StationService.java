package dao.services;

import dao.jdbc.BusDAO;
import dao.jdbc.StationDAO;
import dao.model.Bus;
import dao.model.Station;

import java.util.List;

public class StationService {
    public Station getStationById(int id) {

        StationDAO stationDAO = new StationDAO();
        Station station = new Station();
        station = stationDAO.getEntityById(id);
        BusDAO busDAO = new BusDAO();
        station.setBuses(busDAO.getAllBusesByStationId(id));
        return station;
    }
}
