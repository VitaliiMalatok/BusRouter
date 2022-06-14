package dao.interfaces;

import dao.model.Station;
import java.util.List;

public interface IStationDAO extends IBaseDAO<Station> {
        void showAllStations();
        Station getStationStartByRouteId(int id);
        Station getStationFinishByRouteId(int id);
        List<Station> getAllStations();
}
