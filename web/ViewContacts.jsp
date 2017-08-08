<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>  
<style>
a
{
	text-decoration: none;
	color:red;
}
th
{
    background-color:red;
    color: white;
}
</style>
</head>
 <body style="background-image: url(images/bg1.jpg);">
<%!
Connection con;
PreparedStatement ps;
Statement st;
ResultSet rs;
String name,email,contact,comment;
%>
<div class="container-fluid" style="padding:0px;">
<div class="table-responsive"> 
<table border="3" class="table table-striped">
<tr>
<th>User Name</th><th>Email</th><th>Contact No.</th><th>Comment</th>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=con.createStatement(); 
	rs=st.executeQuery("select * from Table_Contact");
	while(rs.next())
	{
		name=rs.getString("Uname");
		email=rs.getString("Email");
                contact=rs.getString("Contact_No");
                comment=rs.getString("Comment");
		
%>
<tr>
	<td><%=name%></td><td><%=email%></td><td><%=contact%></td><td><%=comment%></td>
</tr>	
<%	
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
</table></div></div>
<center>
    <a href="index.html">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdminHome.jsp">Admin's Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>
</center>
</body>
</html>