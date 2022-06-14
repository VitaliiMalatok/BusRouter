package com.solvd.laba.dao.interfaces;

import com.solvd.laba.dao.model.Route;

import java.util.List;

public interface IRouteDAO extends IBaseDAO<Route> {
    void showAllRoutes();

    void removeEntity(int id);

    List<Route> getAllRoutes();

}
