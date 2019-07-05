<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String uId = request.getParameter("uId");
		String Pid = request.getParameter("pId");
		String cId = request.getParameter("cId");
		
		out.println("UserId is: "+uId+"\n");
		out.println("Competition Id: "+cId+"\n");
		out.println("Picture Id: "+Pid+"\n");
		
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
	%>
	<h1 align="center">All voters for this competition who given vote to you!!!</h1>
	<table align="center" border="1">
		<tr>
			<td align="center">Voter Name</td>
			<td align="center">Voter Email</td>
			<td align="center">Voting Time</td>
		</tr>
		<%
			conn = DBConnection.createConnection();
			String sql = "select * from tbl_vote where cId=? and userId=? and pictureId=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, cId);
			pst.setString(2, uId);
			pst.setString(3, Pid);
			//pst.setString(1, competitionId);
			rs = pst.executeQuery();
			while(rs.next()){
		%>
		<tr>
			<td align="center"><%=rs.getString("vName") %></td>
			<td align="center"><%=rs.getString("vMail") %></td>
			<td align="center"><%=rs.getString("time") %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>