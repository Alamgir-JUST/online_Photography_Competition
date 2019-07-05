<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
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
	String s = (String)session.getAttribute("userName");
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	out.print(s);
	%>
	<h1 align="center">Your Organized Competitions are Listed Below</h1>
	<table align="center" border="1">
		<tr>
			<td align="center">Competition Name</td>
			<td align="center">Competition Type</td>
			<td align="center">Start Date</td>
			<td align="center">End Date</td>
			<td align="center">Prizes</td>
			<td align="center">Participate</td>
			<td align="center">Action</td>
		</tr>
		<%
			conn = DBConnection.createConnection();
			String sql ="select distinct competitionId, userId, competitionType, startDate, endDate, prizes, comments from tbl_competition where userId=? order by endDate desc";
			pst = conn.prepareStatement(sql);
			pst.setString(1, s);
			rs = pst.executeQuery();
			
			while(rs.next()){
		%>
		<tr>
			<td align="center"><%=rs.getString("competitionId") %></td>
			<td align="center"><%=rs.getString("competitionType") %> </td>
			<td align="center"><%=rs.getString("startDate") %></td>
			<td align="center"><%=rs.getString("endDate") %></td>
			<td align="center"><%=rs.getString("prizes") %></td>
			<td align="center"><a href="participateCompetition.jsp?uid=<%=rs.getString("userId")%>&cid=<%=rs.getString("competitionId")%>">Participate</a></td>
			<td align="center"><a href="delete.jsp?uid=<%=rs.getString("userId")%>">Delete</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>