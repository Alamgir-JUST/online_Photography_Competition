package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.register;
import com.util.DBConnection;

public class registerDao {
	public String userRegister(register registerBean) throws ClassNotFoundException {
		String uid = registerBean.getUserId();
		String name = registerBean.getName();
		String password = registerBean.getPassword();
		String email = registerBean.getEmail();
		String address = registerBean.getAddress();
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		try {
			conn = DBConnection.createConnection();
			String insertQuery = "INSERT INTO tbl_user(userId, name, password, email, address) VALUES(?,?,?,?,?)";
			pst =conn.prepareStatement(insertQuery);
			pst.setString(1, uid);
			pst.setString(2, name);
			pst.setString(3, password);
			pst.setString(4, email);
			pst.setString(5, address);
			
			int i = pst.executeUpdate();
			
			if(i!=0) {
				return "SUCCESS";
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "Something went Worng!!!";
	}
}
