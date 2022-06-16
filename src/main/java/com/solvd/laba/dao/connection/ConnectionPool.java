package com.solvd.laba.dao.connection;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

public class ConnectionPool {

    private static final Logger LOGGER = LogManager.getLogger(ConnectionPool.class);
    private static ConnectionPool instance = null;
    private static final int INITIAL_POOL_SIZE = 15;

    private ConnectionPool() {
    }

    private static List<Connection> freeConnections = new ArrayList<>();
    private static List<Connection> usedConnections = new ArrayList<>();

    public static synchronized ConnectionPool getInstance() {
        if (instance == null) {
            instance = new ConnectionPool();
            create();
        }
        return instance;
    }

    public static void create() {
        Properties p = new Properties();
        FileInputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(System.getProperty("user.dir") + "/src/main/resources/db.properties");
            p.load(fileInputStream);
            fileInputStream.close();
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }

        String url = p.getProperty("db.url");
        String userName = p.getProperty("db.username");
        String password = p.getProperty("db.password");

        for (int i = 0; i < INITIAL_POOL_SIZE; i++) {
            freeConnections.add(createConnection(url, userName, password));
        }
    }

    public synchronized Connection getConnection() {
        Connection connection = freeConnections.remove(freeConnections.size() - 1);
        usedConnections.add(connection);
        return connection;
    }

    public synchronized void releaseConnection(Connection connection) throws SQLException {
        if (connection != null) {
            if (usedConnections.remove(connection)) {
                freeConnections.add(connection);
            } else {
                throw new SQLException("The connection has already returned or it's not for this pool.");
            }
        }
    }

    private static Connection createConnection(String url, String user, String password) {
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            LOGGER.error(e.getMessage());
        }
        return null;
    }

    public int getSize() {
        return freeConnections.size() + usedConnections.size();
    }

}
