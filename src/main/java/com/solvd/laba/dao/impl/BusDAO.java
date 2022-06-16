package com.solvd.laba.dao.impl;

import com.solvd.laba.dao.connection.ConnectionPool;
import com.solvd.laba.dao.interfaces.IBusDAO;
import com.solvd.laba.dao.model.Bus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BusDAO implements IBusDAO {

    private ConnectionPool pool = ConnectionPool.getInstance();

    public static final String SQL_SELECT_BY_ID = "select * from buses where id=?";
    public static final String SQL_CREATE_NEW_BUS = "insert into buses (id, number) values (?, ?)";
    public static final String SQL_GET_ALL_BUSES_BY_STATION_ID = "SELECT buses.id, buses.number FROM buses INNER JOIN stations_have_buses ON " +
            "buses.id = stations_have_buses.buses_id INNER JOIN stations ON stations.id = stations_have_buses.stations_id WHERE stations.id IN (?)";

    private static final Logger LOGGER = LogManager.getLogger(BusDAO.class);

    @Override
    public List<Bus> getAllBusesByStationId(int id) {
        Connection connection = pool.getConnection();
        List<Bus> buses = new ArrayList<>();
        try (PreparedStatement pr = connection.prepareStatement(SQL_GET_ALL_BUSES_BY_STATION_ID)) {
            pr.setInt(1, id);
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    Bus bus = new Bus();
                    bus.setId(rs.getInt("id"));
                    bus.setNumber(rs.getString("number"));
                    buses.add(bus);
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
        return buses;
    }

    @Override
    public Bus getEntityById(int id) {
        Connection connection = pool.getConnection();
        Bus bus = new Bus();
        try (PreparedStatement pr = connection.prepareStatement(SQL_SELECT_BY_ID)) {
            pr.setInt(1, id);
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    bus.setId(rs.getInt("id"));
                    bus.setNumber(rs.getString("number"));
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
        return bus;
    }

    @Override
    public void createEntity(Bus entity) {
        Connection connection = pool.getConnection();
        try (PreparedStatement pr = connection.prepareStatement(SQL_CREATE_NEW_BUS)) {
            pr.setInt(1, entity.getId());
            pr.setString(2, entity.getNumber());
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
    public void updateEntity(Bus entity) {
        Connection connection = pool.getConnection();
        String query = "update buses set number = ? where id = ?";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, entity.getId());
            pr.setString(2, entity.getNumber());
            pr.executeUpdate();
            LOGGER.info("Data of Bus has been updated.");
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
        String query = "delete from buses where id=?";
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
    public List<Bus> getAllBuses() {
        Connection connection = pool.getConnection();
        List<Bus> buses = new ArrayList<>();
        String query = "SELECT * FROM buses";
        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.execute();
            try (ResultSet rs = pr.getResultSet()) {
                while (rs.next()) {
                    Bus bus = new Bus();
                    bus.setId(rs.getInt("id"));
                    bus.setNumber(rs.getString("number"));
                    buses.add(bus);
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
        return buses;
    }

}