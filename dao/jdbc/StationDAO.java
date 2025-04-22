package dao.jdbc;

import dao.connectionpull.ConnectionPool;
import dao.interfaces.IStationDAO;
import dao.model.Station;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StationDAO  implements IStationDAO {

    private static final Logger LOGGER = LogManager.getLogger(StationDAO.class);
    private Station c = new Station();
    private Connection connection = null;
    private PreparedStatement pr = null;
    private ResultSet resultSet = null;

    @Override
    public void showAllStations() {

        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Stations ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                c.setId(resultSet.getInt("id"));
                c.setName(resultSet.getString("name"));
                c.setCity(resultSet.getString("city"));
                c.setLatitude(resultSet.getDouble("latitude"));
                c.setLongitude(resultSet.getDouble("longitude"));
                c.setBuses(resultSet.getObject("bus"));
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
    public Station getEntityById(int id) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
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
                c.setBuses(resultSet.getObject("bus"));
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
    public void createEntity(Station entity) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("insert into Stations (StationStart,StationFinish) values (?,?)");
            c.setId(resultSet.getInt("id"));
            c.setName(resultSet.getString("name"));
            c.setCity(resultSet.getString("city"));
            c.setLatitude(resultSet.getDouble("latitude"));
            c.setLongitude(resultSet.getDouble("longitude"));
            c.setBuses(resultSet.getObject("bus"));
            LOGGER.info("A new Station has been created: " + entity);
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
    public void updateEntity(Station entity) {
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("update Stations set id=?,distance=?,StationFinish=? where id=?");
            pr.setInt(1, entity.getId());
            pr.setDouble(2, entity.getName());
            pr.setString(3, entity.getCity());
            pr.setDouble(4, entity.getLatitude());
            pr.setDouble(5, entity.getLongitude());
            pr.executeUpdate();
            LOGGER.info("Data of Station has been updated.");
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
            pr = connection.prepareStatement("delete from Stations where id=?");
            pr.setInt(1, id);
            pr.executeUpdate();
            LOGGER.info("Station has been removed.");
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
    public List<Station> getAllStations() {
        List<Station> Stations = new ArrayList<>();
        try {
            connection = ConnectionPool.getInstance().takeConnection();
            pr = connection.prepareStatement("select * from Stations ");
            pr.execute();
            resultSet = pr.getResultSet();
            while (resultSet.next()) {
                Station Station= new Station();
                Station.setId(resultSet.getInt("id"));
                Station.setName(resultSet.getString("name"));
                Station.setLatitude(resultSet.getDouble("Latitude"));
                Station.setLongitude(resultSet.getDouble("Longitude"));
                Stations.add(Station);
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
        return Stations;
    }

}

