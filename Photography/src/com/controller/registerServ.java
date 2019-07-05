package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.dao.registerDao;
import com.model.register;

/**
 * Servlet implementation class registerServ
 */
@WebServlet("/registerServ")
public class registerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServ() {
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
		
		String userid = request.getParameter("userId");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		register reg = new register();
		reg.setUserId(userid);
		reg.setName(name);
		reg.setPassword(password);
		reg.setEmail(email);
		reg.setAddress(address);
		
		registerDao rDao = new registerDao();
		try {
			String returnMsg = rDao.userRegister(reg);
			
			if(returnMsg.equals("SUCCESS")) {
				out.print("Value inserted into User");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else {
				request.setAttribute("errMsg", returnMsg);
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
