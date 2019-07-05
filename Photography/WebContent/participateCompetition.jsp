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
	String userName = request.getParameter("uid");
	String cId = request.getParameter("cid");
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	out.print(s);
	%>
	<h1 align="center">Your participated Competitions are Listed Below</h1>
	<table align="center" border="1">
		<tr>
			<td align="center">Competition Name</td>
			<td align="center">Picture Id</td>
			<td align="center">Picture</td>
			<td align="center">Voter List</td>
			<td align="center">Position</td>
		</tr>
		<%
			conn = DBConnection.createConnection();
			String sql ="select competitorId, competitionId, picture, pictureId from tbl_competitor where competitorId=? and competitionId=? order by competitionId desc";
			pst = conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, cId);
			rs = pst.executeQuery();
			
			while(rs.next()){
		%>
		<tr>
			<td align="center"><%=rs.getString("competitionId") %></td>
			<td align="center"><%=rs.getString("pictureId") %> </td>
			<td align="center"><img src="<%=rs.getString("picture") %>" height="150px" width="130px"></td>
			<td align="center"><a href="voterList.jsp?uId=<%=rs.getString("competitorId")%>&cId=<%=rs.getString("competitionId")%>&pId=<%=rs.getString("pictureId")%>">Voter</a></td>
			<td align="center"><a>Position</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>