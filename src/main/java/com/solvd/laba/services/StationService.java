package com.solvd.laba.services;


import com.solvd.laba.dao.impl.BusDAO;
import com.solvd.laba.dao.impl.StationDAO;
import com.solvd.laba.dao.model.Station;

public class StationService {
    public Station getStationById(int id) {

        StationDAO stationDAO = new StationDAO();
        Station station = stationDAO.getEntityById(id);
        BusDAO busDAO = new BusDAO();
        station.setBuses(busDAO.getAllBusesByStationId(id));
        return station;
    }
}