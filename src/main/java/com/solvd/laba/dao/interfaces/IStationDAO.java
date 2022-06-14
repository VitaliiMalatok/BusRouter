package com.solvd.laba.dao.interfaces;


import com.solvd.laba.dao.model.Station;

import java.util.List;

public interface IStationDAO extends IBaseDAO<Station> {
        void showAllStations();
        Station getStationStartByRouteId(int id);
        Station getStationFinishByRouteId(int id);
        List<Station> getAllStations();
}
