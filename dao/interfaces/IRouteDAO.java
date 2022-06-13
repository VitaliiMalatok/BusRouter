package dao.interfaces;

import dao.model.Route;
import java.util.*;

public interface IRouteDAO extends IBaseDAO<Route>{
    void showAllRoutes();

    void removeEntity(int id);

    List<Route> getAllRoutes();

}
