package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

/**
 * Servlet implementation class loginServ
 */
@WebServlet("/loginServ")
public class loginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		String nm="";
		
		try {
			conn = DBConnection.createConnection();
			String sql = "SELECT * from tbl_user where userId=? and password=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, password);
			rs = pst.executeQuery();
			int i = 0;
			while(rs.next()) {
				i++;
				//nm = rs.getString("name");
			}
			if(i == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				
				out.print("UserName and Password is Correct");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}else if(i>1) {
				out.print("Duplicate User and Password!!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else {
				out.print("UserName or Password are not Correct Please try again!!!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
