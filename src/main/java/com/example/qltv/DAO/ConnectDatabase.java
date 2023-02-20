package com.example.qltv.DAO;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;

public class ConnectDatabase {
	
	public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException
	{
		String dbURL = "jdbc:mysql://localhost:3306/manage_library?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password = "";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, username, password);
		if (conn != null) {
			System.out.println("Kết nối thành công");
			return conn;
		}
		return null;
	}
}
