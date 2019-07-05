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
import javax.websocket.Session;

import com.util.DBConnection;


/**
 * Servlet implementation class competitionServ
 */
@WebServlet("/competitionServ")
public class competitionServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public competitionServ() {
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
		
		String setterName = request.getParameter("setterName");
		String setterId = request.getParameter("setterId");
		String cId = request.getParameter("cId");
		String competitionType = request.getParameter("competitionType");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String prizes = request.getParameter("prizes");
		String comments = request.getParameter("comments");
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_competition(competitionId, userId, competitionType, startDate, endDate, prizes, comments) values(?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, cId);
			pst.setString(2, setterId);
			pst.setString(3, competitionType);
			pst.setString(4, startDate);
			pst.setString(5, endDate);
			pst.setString(6, prizes);
			pst.setString(7, comments);
			
			int i = pst.executeUpdate();
			
			if(i!=0) {
				out.println("Competition Added!!!");
				request.getRequestDispatcher("pcompetition.jsp").forward(request, response);
			}else {
				out.print("Not Added!!!");
				request.getRequestDispatcher("competition.jsp").forward(request, response);
			}
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
