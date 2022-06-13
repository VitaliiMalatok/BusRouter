package dao.connectionpull;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;


public class ConnectionPool {
    private static final Logger LOGGER = LogManager.getLogger(ConnectionPool.class);
    private static ConnectionPool connectionPool;
    private static Properties p = new Properties();
    public static String userName;
    public static String url;
    public static String password;
    private int conAmount = 0;
    private int maxAmount = 5;

    static {

        try (FileInputStream f = new FileInputStream(System.getProperty("user.dir") + "/java/main///")) {
            p.load(f);
        } catch (IOException e) {
            LOGGER.info(e);
        }
        url = p.getProperty("db.url");
        userName = p.getProperty("db.username");
        password = p.getProperty("db.password");
    }

    private static final List<Connection> connectionList = Collections.synchronizedList(new ArrayList<>());

    private ConnectionPool() {

    }

    public static ConnectionPool getInstance() {
        connectionPool = ConnectionPool.newInstance();
        return connectionPool;
    }

    public static synchronized ConnectionPool newInstance() {
        if (connectionPool == null) {
            LOGGER.info("pool is created");
            connectionPool = new ConnectionPool();
        }
        return connectionPool;
    }

    public synchronized Connection takeConnection() {
        if (!connectionList.isEmpty()) {
            return connectionList.remove(0);
        } else if (conAmount < maxAmount) {
            try {
                conAmount++;
                return DriverManager.getConnection(url, userName, password);
            } catch (SQLException throwables) {
                conAmount--;
                LOGGER.info(throwables);
            }
        }
        return null;
    }

    public synchronized void returnConnection(Connection connection) {
        if (connection != null) connectionList.add(connection);
        LOGGER.debug("Connection returns in pool");

    }

}
