package com.solvd.laba.dao.impl;

import com.solvd.laba.dao.connection.ConnectionPool;
import com.solvd.laba.dao.interfaces.IStationDAO;
import com.solvd.laba.dao.model.Station;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StationDAO implements IStationDAO {

    private ConnectionPool pool = ConnectionPool.getInstance();

    private static final String GET_STATION_START_BY_ROUTE_ID = "SELECT stations.* FROM stations " +
            "inner join routes on routes.station_id1 = stations.id where routes.id = (?)";
    private static final String GET_STATION_FINISH_BY_ROUTE_ID = "SELECT stations.* FROM stations " +
            "inner join routes on routes.station_id2 = stations.id where routes.id = (?)";

    private static final Logger LOGGER = LogManager.getLogger(StationDAO.class);

    @Override
    public void showAllStations() {
        Connection connection = pool.getConnection();
        String query = "SELECT * FROM stations";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    Station station = new Station();
                    station.setId(rs.getInt("id"));
                    station.setName(rs.getString("name"));
                    station.setCity(rs.getString("city"));
                    station.setLatitude(rs.getDouble("latitude"));
                    station.setLongitude(rs.getDouble("longitude"));
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
    public Station getStationStartByRouteId(int id) {
        Connection connection = pool.getConnection();
        Station station = new Station();
        try (PreparedStatement pr = connection.prepareStatement(GET_STATION_START_BY_ROUTE_ID)) {
            pr.setInt(1, id);
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    station.setId(rs.getInt("id"));
                    station.setName(rs.getString("name"));
                    station.setCity(rs.getString("city"));
                    station.setLatitude(rs.getDouble("latitude"));
                    station.setLongitude(rs.getDouble("longitude"));
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
        return station;
    }

    @Override
    public Station getStationFinishByRouteId(int id) {
        Connection connection = pool.getConnection();
        Station station = new Station();
        try (PreparedStatement pr = connection.prepareStatement(GET_STATION_FINISH_BY_ROUTE_ID)) {
            pr.setInt(1, id);
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    station.setId(rs.getInt("id"));
                    station.setName(rs.getString("name"));
                    station.setCity(rs.getString("city"));
                    station.setLatitude(rs.getDouble("latitude"));
                    station.setLongitude(rs.getDouble("longitude"));
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
        return station;
    }

    @Override
    public Station getEntityById(int id) {
        Connection connection = pool.getConnection();
        Station station = new Station();
        String query = "select * from stations where id=?";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, id);
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    station.setId(rs.getInt("id"));
                    station.setName(rs.getString("name"));
                    station.setCity(rs.getString("city"));
                    station.setLatitude(rs.getDouble("latitude"));
                    station.setLongitude(rs.getDouble("longitude"));
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
        return station;

    }

    @Override
    public void createEntity(Station entity) {
        Connection connection = pool.getConnection();
        String query = "insert into stations (name, latitude, longitude, city) values (?,?,?,?)";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setString(1, entity.getName());
            pr.setDouble(2, entity.getLatitude());
            pr.setDouble(3, entity.getLongitude());
            pr.setString(4, entity.getCity());
            pr.executeUpdate();
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
    public void updateEntity(Station entity) {
        Connection connection = pool.getConnection();
        String query = "update stations set id=?,distance=?,StationFinish=? where id=?";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, entity.getId());
            pr.setString(2, entity.getName());
            pr.setString(3, entity.getCity());
            pr.setDouble(4, entity.getLatitude());
            pr.setDouble(5, entity.getLongitude());
            pr.executeUpdate();
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
    public void removeEntity(int id) {
        Connection connection = pool.getConnection();
        String query = "delete from Stations where id=?";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, id);
            pr.executeUpdate();
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
    public List<Station> getAllStations() {
        Connection connection = pool.getConnection();
        String query = "select * from stations";
        List<Station> stations = new ArrayList<>();
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    Station station = new Station();
                    station.setId(rs.getInt("id"));
                    station.setCity(rs.getString("city"));
                    station.setName(rs.getString("name"));
                    station.setLatitude(rs.getDouble("Latitude"));
                    station.setLongitude(rs.getDouble("Longitude"));
                    stations.add(station);
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
        return stations;
    }

}