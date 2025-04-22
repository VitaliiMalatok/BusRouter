package dao.interfaces;

import dao.model.Station;
import java.util.List;

public interface IStationDAO extends IBaseDAO<Station> {
        void showAllStations();
        List<Station> getAllStations();
}
