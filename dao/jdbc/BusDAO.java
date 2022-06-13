package dao.jdbc;

import dao.connectionpull.ConnectionPool;
import dao.interfaces.IBusDAO;
import dao.model.Bus;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BusDAO  implements IBusDAO {

    private static final Logger LOGGER = LogManager.getLogger(BusDAO.class);
    private Bus c = new Bus();
    private Connection connection = null;
    private PreparedStatement pr = null;
    private ResultSet resultSet = null;

    @Override
    public void showAllBuses() {

        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Buses ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setNumber(resultSet.getInt("number"));
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
    public Bus getEntityById(int id) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Buses where id=?");
            pr.setInt(1, id);
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setNumber(resultSet.getInt("number"));
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
    public void createEntity(Bus entity) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("insert into Buses number");
            c.setId(resultSet.getInt("id"));
            c.setNumber(resultSet.getInt("number"));
            LOGGER.info("A new Bus has been created: " + entity);
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
    public void updateEntity(Bus entity) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("update Buses set id=?,distance=?,validTHRU=? where id=?");
            pr.setInt(1, entity.getId());
            pr.setInt(2, entity.getNumber());
            pr.executeUpdate();
            LOGGER.info("Data of Bus has been updated.");
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
            pr = connection.prepareStatement("delete from Buses where id=?");
            pr.setInt(1, id);
            pr.executeUpdate();
            LOGGER.info("Bus has been removed.");
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
    public List<Bus> getAllBuses() {
        List<Bus> Buses = new ArrayList<>();
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Buses ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                Bus Bus= new Bus();
                Bus.setId(resultSet.getInt("id"));
                Bus.setNumber(resultSet.getInt("number"));
                Buses.add(Bus);
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
        return Buses;
    }

}

