package com.example.qltv.BO;

import java.sql.SQLException;

import com.example.qltv.Bean.User;
import com.example.qltv.DAO.UserDAO;

public class UserBO {
	UserDAO userDAO = new UserDAO();

	public User getAccount(String username, String password) throws ClassNotFoundException, SQLException {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return userDAO.getUser(username, password);
	}
}
