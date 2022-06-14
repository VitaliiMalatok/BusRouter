package com.solvd.laba.dao.impl;


import com.solvd.laba.dao.connection.ConnectionPool;
import com.solvd.laba.dao.interfaces.IStationDAO;
import com.solvd.laba.dao.model.Bus;
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

    private static final String GET_STATION_START_BY_ROUTE_ID = "SELECT stations.* FROM stations " +
            "inner join routes on routes.station_id1 = stations.id where routes.id = (?)";
    private static final String GET_STATION_FINISH_BY_ROUTE_ID = "SELECT stations.* FROM stations " +
            "inner join routes on routes.station_id2 = stations.id where routes.id = (?)";

    private static final Logger LOGGER = LogManager.getLogger(StationDAO.class);
    private Station c = new Station();
    private Bus bus = new Bus();
    private Connection connection = null;
    private PreparedStatement pr = null;
    private ResultSet resultSet = null;

    @Override
    public void showAllStations() {

        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from Stations ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setName(resultSet.getString("name"));
                c.setCity(resultSet.getString("city"));
                c.setLatitude(resultSet.getDouble("latitude"));
                c.setLongitude(resultSet.getDouble("longitude"));
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
            try {
                if (pr != null) pr.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public Station getStationStartByRouteId(int id) {
        Station station = new Station();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = ConnectionPool.getInstance().getConnection();
            statement = connection.prepareStatement(GET_STATION_START_BY_ROUTE_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                station.setId(resultSet.getInt("id"));
                station.setName(resultSet.getString("name"));
                station.setCity(resultSet.getString("city"));
                station.setLatitude(resultSet.getDouble("latitude"));
                station.setLongitude(resultSet.getDouble("longitude"));
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                statement.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
            try {
                resultSet.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
            ConnectionPool.getInstance().releaseConnection(connection);
        }
        return station;
    }

    @Override
    public Station getStationFinishByRouteId(int id) {
        Station station = new Station();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = ConnectionPool.getInstance().getConnection();
            statement = connection.prepareStatement(GET_STATION_FINISH_BY_ROUTE_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                station.setId(resultSet.getInt("id"));
                station.setName(resultSet.getString("name"));
                station.setCity(resultSet.getString("city"));
                station.setLatitude(resultSet.getDouble("latitude"));
                station.setLongitude(resultSet.getDouble("longitude"));
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            try {
                statement.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
            try {
                resultSet.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
            ConnectionPool.getInstance().releaseConnection(connection);
        }
        return station;
    }

    @Override
    public Station getEntityById(int id) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from Stations where id=?");
            pr.setInt(1, id);
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setName(resultSet.getString("name"));
                c.setCity(resultSet.getString("city"));
                c.setLatitude(resultSet.getDouble("latitude"));
                c.setLongitude(resultSet.getDouble("longitude"));
            }
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
            try {
                if (pr != null) pr.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
        return c;

    }

    @Override
    public void createEntity(Station entity) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("insert into stations (name, latitude, longitude, city) values (?,?,?,?)");
            pr.setString(1, entity.getName());
            pr.setDouble(2, entity.getLatitude());
            pr.setDouble(3, entity.getLongitude());
            pr.setString(4, entity.getCity());
            pr.executeUpdate();
            LOGGER.info("A new Station has been created: " + entity);
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
    public void updateEntity(Station entity) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("update Stations set id=?,distance=?,StationFinish=? where id=?");
            pr.setInt(1, entity.getId());
            pr.setString(2, entity.getName());
            pr.setString(3, entity.getCity());
            pr.setDouble(4, entity.getLatitude());
            pr.setDouble(5, entity.getLongitude());
            pr.executeUpdate();
            LOGGER.info("Data of Station has been updated.");
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
            pr = connection.prepareStatement("delete from Stations where id=?");
            pr.setInt(1, id);
            pr.executeUpdate();
            LOGGER.info("Station has been removed.");
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
    public List<Station> getAllStations() {
        List<Station> Stations = new ArrayList<>();
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from Stations ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                Station Station = new Station();
                Station.setId(resultSet.getInt("id"));
                Station.setCity(resultSet.getString("city"));
                Station.setName(resultSet.getString("name"));
                Station.setLatitude(resultSet.getDouble("Latitude"));
                Station.setLongitude(resultSet.getDouble("Longitude"));
                Stations.add(Station);
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
        return Stations;
    }

}