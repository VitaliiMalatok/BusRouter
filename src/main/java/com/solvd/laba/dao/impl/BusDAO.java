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

    public static final String SQL_SELECT_BY_ID = "select * from buses where id=?";
    public static final String SQL_CREATE_NEW_BUS = "insert into buses number";
    public static final String SQL_GET_ALL_BUSES_BY_STATION_ID = "SELECT buses.id, buses.number FROM buses INNER JOIN stations_have_buses ON " +
            "buses.id = stations_have_buses.buses_id INNER JOIN stations ON stations.id = stations_have_buses.stations_id WHERE stations.id IN (?)";

    private static final Logger LOGGER = LogManager.getLogger(BusDAO.class);
    private Bus c = new Bus();
    private Connection connection = null;
    private PreparedStatement pr = null;
    private ResultSet resultSet = null;

    @Override
    public List<Bus> getAllBusesByStationId(int id) {
        List<Bus> buses = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = ConnectionPool.getInstance().getConnection();
            statement = connection.prepareStatement(SQL_GET_ALL_BUSES_BY_STATION_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Bus bus = new Bus();
                bus.setId(resultSet.getInt("id"));
                bus.setNumber(resultSet.getString("number"));
                buses.add(bus);
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
        return buses;
    }


    @Override
    public Bus getEntityById(int id) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement(SQL_SELECT_BY_ID);
            pr.setInt(1, id);
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setNumber(resultSet.getString("number"));
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
    public void createEntity(Bus entity) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement(SQL_CREATE_NEW_BUS);
            c.setId(resultSet.getInt("id"));
            c.setNumber(resultSet.getString("number"));
            LOGGER.info("A new Bus has been created: " + entity);
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
            try {
                if (pr != null) pr.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public void updateEntity(Bus entity) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("update Buses set number = ? where id = ?");
            pr.setInt(1, entity.getId());
            pr.setString(2, entity.getNumber());
            pr.executeUpdate();
            LOGGER.info("Data of Bus has been updated.");
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
            try {
                if (pr != null) pr.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public void removeEntity(int id) {
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("delete from buses where id=?");
            pr.setInt(1, id);
            pr.executeUpdate();
            LOGGER.info("Bus has been removed.");
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        } finally {
            ConnectionPool.getInstance().releaseConnection(connection);
            try {
                if (pr != null) pr.close();
            } catch (SQLException e) {
                LOGGER.error(e.getMessage());
            }
        }
    }

    @Override
    public List<Bus> getAllBuses() {
        List<Bus> Buses = new ArrayList<>();
        try {
            connection = ConnectionPool.getInstance().getConnection();
            pr = connection.prepareStatement("select * from buses ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                Bus Bus = new Bus();
                Bus.setId(resultSet.getInt("id"));
                Bus.setNumber(resultSet.getString("number"));
                Buses.add(Bus);
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
        return Buses;
    }

}

