<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">Please Register with Your Correct Information</h1>
<form action="registerServ" method="post" name="registerForm">
	<table align="center" name="registerTbl" border="1">
		<tr>
			<td>Name: </td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>UserName: </td>
			<td><input type="text" name="userId"></td>
		</tr>
		<tr>
			<td>Email: </td>
			<td><input type="email" name="email"></td>
		</tr>
		<tr>
			<td>Password: </td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>Address: </td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="Register"></td>
		</tr>
	</table>
</form>
</body>
</html>