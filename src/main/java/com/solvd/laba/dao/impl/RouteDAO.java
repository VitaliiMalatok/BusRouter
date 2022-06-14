package com.solvd.laba.dao.impl;

import com.solvd.laba.dao.connection.MyConnectionPool;
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

    private MyConnectionPool pool = MyConnectionPool.getInstance();

    private static final Logger LOGGER = LogManager.getLogger(RouteDAO.class);

    @Override
    public void showAllRoutes() {
        Connection connection = pool.getConnection();
        String query = "SELECT * FROM routes";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    Route route = new Route();
                    route.setId(rs.getInt("id"));
                    route.setDistance(rs.getDouble("distance"));
                    LOGGER.info(route);
                }
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    pool.releaseConnection(connection);
                } catch (SQLException e) {
                    LOGGER.error(e.getMessage());
                }
            }
        }
    }

    @Override
    public Route getEntityById(int id) {
        Connection connection = pool.getConnection();
        Route route = new Route();
        String query = "SELECT * FROM routes WHERE id = (?)";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, id);
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    route.setId(rs.getInt("id"));
                    route.setDistance(rs.getDouble("distance"));
                }
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                if (connection != null) pool.releaseConnection(connection);
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
        return route;
    }

    @Override
    public void createEntity(Route entity) {
        Connection connection = pool.getConnection();
        String query = "insert into routes (distance, station_id1, station_id2) values (?,?,?)";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setDouble(1, entity.getDistance());
            pr.setInt(2, entity.getStationStart().getId());
            pr.setInt(3, entity.getStationFinish().getId());
            pr.executeUpdate();
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                if (connection != null) pool.releaseConnection(connection);
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public void updateEntity(Route entity) {
        Connection connection = pool.getConnection();
        String query = "update routes set distance = ?, station_id1 = ?, station_id2 = ? where id = ?";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setDouble(1, entity.getDistance());
            pr.setInt(2, entity.getStationStart().getId());
            pr.setInt(3, entity.getStationFinish().getId());
            pr.setInt(4, entity.getId());
            pr.executeUpdate();
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                if (connection != null) pool.releaseConnection(connection);
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public void removeEntity(int id) {
        Connection connection = pool.getConnection();
        String query = "delete from routes where id=?";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, id);
            pr.executeUpdate();
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                if (connection != null) pool.releaseConnection(connection);
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public List<Route> getAllRoutes() {
        Connection connection = pool.getConnection();
        List<Route> routes = new ArrayList<>();
        String query = "select * from routes";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    Route route = new Route();
                    route.setId(rs.getInt("id"));
                    route.setDistance(rs.getDouble("distance"));
                    routes.add(route);
                }
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            if(connection != null) {
                try {
                    pool.releaseConnection(connection);
                } catch (SQLException e) {
                    LOGGER.error(e.getMessage());
                }
            }
        }
        return routes;
    }

}