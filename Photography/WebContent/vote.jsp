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
	
	String uid = request.getParameter("uid");
	String pid = request.getParameter("pid");
	String cid = request.getParameter("cid");
	out.print(pid);
	out.print(uid);
	out.print(cid);
%>
<h1 align="center">Before voting enter your name and email!!!</h1>
<form action="voteServ" method="post">
	<table align="center">
		<tr>
			<td>Competition Name: </td>
			<td><input type="text" name="cid" value="<%=cid%>" readonly></td>
		</tr>
		<tr>
			<td>Picture Owner: </td>
			<td><input type="text" name="userId" value="<%=uid%>" readonly></td>
		</tr>
		<tr>
			<td>Picture Id: </td>
			<td><input type="text" name="pictureId" value="<%=pid%>" readonly></td>
		</tr>
		<tr>
			<td>Your Name: </td>
			<td><input type="text" name = "name" placeholder="Enter your name--"></td>
		</tr>
		<tr>
			<td>Your Mail:  </td>
			<td><input type="text" name = "email" placeholder="Enter your email"></td>
		</tr>
		<tr>
			<td><input type="submit" value = "Send Now"></td>
		</tr>
	</table>
</form>
</body>
</html>