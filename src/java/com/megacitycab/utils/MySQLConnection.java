package com.megacitycab.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3308/city_cab"; // Replace with your DB details
        String username = "root"; // Replace with your DB username
        String password = ""; // Replace with your DB password

        return DriverManager.getConnection(url, username, password);
    }
}

