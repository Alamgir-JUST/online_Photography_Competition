<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
%>
	<h1 align="center">Before voting select the contestId</h1>
	<form action="" method="post">
	<%
		conn = DBConnection.createConnection();
		String sql = "select distinct competitionId from tbl_competition";
		pst = conn.prepareStatement(sql);
		rs = pst.executeQuery();
	%>
	<table align="center">
		<tr>
			<td>Competition Name: </td>
			<td>
				<select name="competitionType" id="cname">
				<option disabled selected hidden>Select the Photography Type</option>
				<% 
				while(rs.next()){%>
					<option><%=rs.getString("competitionId") %></option>
					<%} %>
				</select>
			</td>
			<td><input type="submit" value="GO"></td>
		</tr>
	</table>
</form>

<%
	String competitionName = request.getParameter("competitionType");
	if(competitionName==null){
		%>
		<h1 align="center"> Please select a Valid Competition Type!!</h1>
		<% 
	}else{
		conn = DBConnection.createConnection();
		String ssll = "select * from tbl_competition where competitionId=?";
		pst = conn.prepareStatement(ssll);
		pst.setString(1, competitionName);
		rs = pst.executeQuery();
		
		while(rs.next()){
			%>
			<h1 align="center">Competition Name: <%=rs.getString("competitionId") %></h1>
			<h1 align="center">Prizes: <%=rs.getString("prizes") %></h1>
			<h1 align="center">Running Date: <%=rs.getString("startDate") %> to <%=rs.getString("endDate") %></h1>
			<% 
		}
	}
%>
<%
	
%>

</body>
</html>