<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	String cname = request.getParameter("id");
	out.print(cname);
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	//String pid="";
%>
	<h1 align="center">All Information About this Contest</h1>
	<table align="center" border="1">
		<tr>
			<td align="center">Competition Name</td>
			<td align="center">Picture Owner</td>
			<td align="center"> Picture Id</td>
			<td align="center">Picture</td>
			<td align="center">Final Date</td>
			<td align="center">Action</td>
		</tr>
		<%
			conn = DBConnection.createConnection();
			String sql = "select userId, competitionId, name, pictureId, picture, endDate from v_competition where competitionId=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, cname);
			rs = pst.executeQuery();
			
			while(rs.next()){
				//pid = rs.getString("pictureId");
		%>
			<tr>
			<td align="center"><%=rs.getString("competitionId") %></td>
			<td align="center"><%=rs.getString("name") %></td>
			<td align="center"><%=rs.getString("pictureId") %></td>

			<td align="center"><img src="<%=rs.getString("picture")%>" height="100px" width="80px"></td>
			<td align="center"><%=rs.getString("enddate") %></td>
			<td align="center"><a href="vote.jsp?pid=<%=rs.getString("pictureId")%>&uid=<%=rs.getString("userId")%>&cid=<%=rs.getString("competitionId")%>">Vote</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>