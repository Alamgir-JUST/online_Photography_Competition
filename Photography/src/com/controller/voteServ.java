package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.util.DBConnection;

/**
 * Servlet implementation class voteServ
 */
@WebServlet("/voteServ")
public class voteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public voteServ() {
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
		
		String cid = request.getParameter("cid");
		String uid = request.getParameter("userId");
		String pid = request.getParameter("pictureId");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		try {
			conn = DBConnection.createConnection();
			String sql = "insert into tbl_vote(cId, userId, pictureId, vName, vMail, time) values(?,?,?,?,?, now())";
			pst = conn.prepareStatement(sql);
			pst.setString(1, cid);
			pst.setString(2, uid);
			pst.setString(3, pid);
			pst.setString(4, name);
			pst.setString(5, email);
			
			int i = pst.executeUpdate();
			
			if(i!=0) {
				out.print("Your Vote is Accepted!!! Thank you!!!");
				request.getRequestDispatcher("pcompetition.jsp").forward(request, response);
			}else {
				out.print("Not Accepted!! Try again");
				request.getRequestDispatcher("pcompetition.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
