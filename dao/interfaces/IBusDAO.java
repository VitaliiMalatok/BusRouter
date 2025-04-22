package dao.interfaces;

import dao.model.Bus;
import dao.model.Station;
import java.util.List;

public interface IBusDAO {
    public interface IStationDAO extends IBaseDAO<Bus> {
        void showAllStations();
        List<Station> getAllStations();
}

