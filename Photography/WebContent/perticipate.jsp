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

	<h1 align="center">Before joining a Competition fill-up this Form</h1>
	<form action="perticipateServ" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
		<tr>
				<td>Your Name: </td>
				<td><input type="text" name="name" value=<%=name%> readonly></td>
			</tr>
			<tr>
				<td>Your Email: </td>
				<td><input type="text" name="email" value=<%=email%> readonly></td>
			</tr>
			<tr>
				<td>Your Address: </td>
				<td><input type="text" name="address" value=<%=address%> readonly></td>
			</tr>
			<tr>
				<td>Your UserName: </td>
				<td><input type="text" name="userName" value=<%=userId%> readonly></td>
			</tr>
			<tr>
				<td>Competition Name/ID: </td>
				<td><input type="text" name="competitionId"></td>
			</tr>
			<tr>
				<td>Mobile No.: </td>
				<td><input type="text" name="mobile"></td>
			</tr>
			<tr>
				<td>Designation: </td>
				<td><input type="text" name="designation"></td>
			</tr>
			<tr>
				<td>Picture for Competition: </td>
				<td><input type="file" name="picture"></td>
			</tr>
			<tr>
				<td>PictureId: </td>
				<td><input type="text" name="pictureId"></td>
			</tr>
			<tr>
				<td>Your Comments: </td>
				<td><input type="text" name="comment"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>