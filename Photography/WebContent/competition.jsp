<%@page import="java.sql.SQLException"%>
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
	String s = (String)session.getAttribute("userName");

	out.print(s);
	
	Connection conn=null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	String name="", userId="", email=" ", address=" ";
	
	try{
		conn = DBConnection.createConnection();
		String sql = "select * from tbl_user where userId=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1, s);
		rs = pst.executeQuery();
		
		while(rs.next()){
			name = rs.getString("name");
			email = rs.getString("email");
			address = rs.getString("address");
			userId = rs.getString("userId");
			//out.print(name+" "+email+" "+address);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	out.print(name+" "+email+" "+address);
%>

	<h1 align="center">Please add a Competition</h1>
	<form action="competitionServ" method="post">
		<table align="center" border="1">
		<tr>
				<td>Setter Name: </td>
				<td><input type="text" name="setterName" value=<%=name%> readonly></td>
			</tr>
			<tr>
				<td>Setter Email: </td>
				<td><input type="text" name="setterEmail" value=<%=email%> readonly></td>
			</tr>
			<tr>
				<td>Setter Address: </td>
				<td><input type="text" name="setterAddress" value=<%=address%> readonly></td>
			</tr>
			<tr>
				<td>Setter UserId: </td>
				<td><input type="text" name="setterId" value=<%=userId%> readonly></td>
			</tr>
			<tr>
				<td>Competition Id/Name: </td>
				<td><input type="text" name="cId"></td>
			</tr>
			<tr>
				<td>Competition Type: </td>
				<td><input type="text" name="competitionType"></td>
			</tr>
			<tr>
				<td>Start Date: </td>
				<td><input type="date" name="startDate"></td>
			</tr>
			<tr>
				<td>End Date: </td>
				<td><input type="date" name="endDate"></td>
			</tr>
			<tr>
				<td>Prizes: </td>
				<td><input type="text" name="prizes"></td>
			</tr>
			<tr>
				<td>Comments: </td>
				<td><input type="text" name="comments"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>
