package com.solvd.laba.dao.impl;

import com.solvd.laba.dao.connection.ConnectionPool;
import com.solvd.laba.dao.interfaces.IRouteDAO;
import com.solvd.laba.dao.model.Route;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RouteDAO implements IRouteDAO {

    private static final Logger LOGGER = LogManager.getLogger(RouteDAO.class);
    private Route c = new Route();
    private Connection connection = null;
    private PreparedStatement pr = null;
    private ResultSet resultSet = null;

    @Override
    public void showAllRoutes() {

        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from Routes ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setDistance(resultSet.getDouble("distance"));
                LOGGER.info(c);
            }
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
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
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from Routes where id=?");
            pr.setInt(1, id);
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setDistance(resultSet.getDouble("distance"));
            }
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
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
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("insert into Routes (StationStart,StationFinish) values (?,?)");
            c.setDistance(resultSet.getDouble("distance"));
            LOGGER.info("A new Route has been created: " + entity);
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
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
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("update Routes set id=?,distance=?,StationFinish=? where id=?");
            pr.setInt(1, entity.getId());
            pr.setDouble(2, entity.getDistance());
            pr.setInt(3, entity.getStationFinish().getId());
            pr.setInt(4, entity.getStationStart().getId());
            pr.executeUpdate();
            LOGGER.info("Data of route has been updated.");
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
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
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("delete from routes where id=?");
            pr.setInt(1, id);
            pr.executeUpdate();
            LOGGER.info("route has been removed.");
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
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
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from routes ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                Route Route = new Route();
                Route.setId(resultSet.getInt("id"));
                Route.setDistance(resultSet.getDouble("distance"));
                Routes.add(Route);
            }
        } catch (SQLException e) {
            LOGGER.info(e);
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
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
