package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

public class DBConnection {
	public static Connection createConnection() throws ClassNotFoundException {
		Connection conn = null;
		String url="jdbc:mysql://localhost:3306/db_photography";
		String username = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connected to Database!!!!");
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
