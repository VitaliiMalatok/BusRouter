package dao.jdbc;

import dao.connectionpull.ConnectionPool;
import dao.interfaces.IRouteDAO;
import dao.model.Route;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RouteDAO  implements IRouteDAO {

    private static final Logger LOGGER = LogManager.getLogger(RouteDAO.class);
    private Route c = new Route();
    private Connection connection = null;
    private PreparedStatement pr = null;
    private ResultSet resultSet = null;

    @Override
    public void showAllRoutes() {

        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Routes ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setDistance(resultSet.getDouble("distance"));
                c.setStationStart(resultSet.getString("StationStart"));
                c.setStationFinish(resultSet.getString("StationFinish"));
                LOGGER.info(c);
            }
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
            try {
                if (pr != null) pr.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                LOGGER.info(e);
            }
        }
    }

    @Override
    public Route getEntityById(int id) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Routes where id=?");
            pr.setInt(1, id);
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setDistance(resultSet.getDouble("distance"));
                c.setStationStart(resultSet.getString("StationStart"));
                c.setStationFinish(resultSet.getString("StationFinish"));
            }
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
            try {
                if (pr != null) pr.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                LOGGER.info(e);
            }
        }
        return c;

    }

    @Override
    public void createEntity(Route entity) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("insert into Routes (StationStart,StationFinish) values (?,?)");
            c.setDistance(resultSet.getDouble("distance"));
            c.setStationStart(resultSet.getString("StationStart"));
            c.setStationFinish(resultSet.getString("StationFinish"));
            LOGGER.info("A new Route has been created: " + entity);
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
            try {
                if (pr != null) pr.close();
            } catch (SQLException e) {
                LOGGER.info(e);
            }
        }
    }

    @Override
    public void updateEntity(Route entity) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("update Routes set id=?,distance=?,StationFinish=? where id=?");
            pr.setInt(1, entity.getId());
            pr.setDouble(2, entity.getDistance());
            pr.setString(3, entity.getStationFinish());
            pr.setString(4, entity.getStationStart());
            pr.executeUpdate();
            LOGGER.info("Data of route has been updated.");
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
            try {
                if (pr != null) pr.close();
            } catch (SQLException e) {
                LOGGER.info(e);
            }
        }
    }

    @Override
    public void removeEntity(int id) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("delete from routes where id=?");
            pr.setInt(1, id);
            pr.executeUpdate();
            LOGGER.info("route has been removed.");
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
            try {
                if (pr != null) pr.close();
            } catch (SQLException e) {
                LOGGER.info(e);
            }
        }
    }

    @Override
    public List<Route> getAllRoutes() {
        List<Route> Routes = new ArrayList<>();
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from routes ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                Route Route= new Route();
                Route.setId(resultSet.getInt("id"));
                Route.setDistance(resultSet.getDouble("distance"));
                Route.setStationStart(resultSet.getString("StationStart"));
                Route.setStationFinish(resultSet.getString("StationFinish"));
                Routes.add(Route);
            }
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
            try {
                if (pr != null) pr.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                LOGGER.info(e);
            }
        }
        return Routes;
    }

}
