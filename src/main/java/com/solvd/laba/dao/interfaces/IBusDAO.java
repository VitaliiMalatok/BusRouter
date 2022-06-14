package dao.interfaces;

import dao.model.Bus;

import java.util.List;

public interface IBusDAO extends IBaseDAO<Bus>{

        List<Bus> getAllBusesByStationId(int id);
        List<Bus> getAllBuses();
}

