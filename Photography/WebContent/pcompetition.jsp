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
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
%>
	<h1 align="center"> Running photography competition are listed below</h1>
	<table align="center" border="1"> 
		<tr>
			<td align="center">Conpetition Name</td>
			<td align="center">Organizer Name</td>
			<td align="center">Organizer email</td>
			<td align="center">Address</td>
			<td align="center">Competition Type</td>
			<td align="center">Start Date</td>
			<td align="center">End Date</td>
			<td align="center"> Prizes</td>
			<td align="center"> View this Competition</td>
		</tr>
		<%
			conn = DBConnection.createConnection();
			String sql = "SELECT DISTINCT competitionId, name, email, address, competitionType, startDate, endDate, prizes from v_pcompetition";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
		%>
		<tr>
			<td align="center"><%=rs.getString("competitionId") %></td>
			<td align="center"><%=rs.getString("name") %></td>
			<td align="center"><%=rs.getString("email") %></td>
			<td align="center"><%=rs.getString("address") %></td>
			<td align="center"><%=rs.getString("competitionType") %></td>
			<td align="center"><%=rs.getString("startDate") %></td>
			<td align="center"><%=rs.getString("endDate") %></td>
			<td align="center"> <%=rs.getString("prizes") %></td>
			<td align="center"><a href="viewcompetition.jsp?id=<%=rs.getString("competitionId")%>">GO</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>