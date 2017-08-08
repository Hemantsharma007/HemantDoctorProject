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
String name,email,gender,pass,age,Reg_Date,contact,dob,status,pid,room,address,disease;
%>
<div class="container-fluid" style="padding:0px;">
<div class="table-responsive"> 
<table border="3" class="table table-striped">
<tr>
<th>PID</th><th>Pname</th><th>Email</th><th>Contact No.</th><th>DOB</th><th>Gender</th><th>Age</th><th>Status</th><th>Address</th><th>Disease</th><th>Room Type</th><th>Registered Date</th><th>Action</th>
</tr>
<%
try
{
       // String id=(String)session.getAttribute("pid");
        //out.println(id);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=con.createStatement(); 
	rs=st.executeQuery("select * from Table_Patient");
	while(rs.next())
	{
		pid=rs.getString("Pid");
		name=rs.getString("Pname");
		email=rs.getString("Email");
                //pass=rs.getString("Pass");
                contact=rs.getString("Contact");
                dob=rs.getString("Dob");
		gender=rs.getString("Gender");
		age=rs.getString("Age");
                status=rs.getString("Pstatus");
		address=rs.getString("Address");
		disease=rs.getString("Disease");
                room=rs.getString("RoomType");
		Reg_Date=rs.getString("Reg_Date");
%>
<tr>
	<td><%=pid%></td><td><%=name%></td><td><%=email%></td><td><%=contact%></td><td><%=dob%></td><td><%=gender%><td><%=age%><td><%=status%><td><%=address%><td><%=disease%></td><td><%=room%></td><td><%=Reg_Date%></td>
        <td><a href="EditPatient.jsp?id=<%=pid%>">Edit</a>&nbsp;&nbsp;&nbsp;<a href="DeletePatient.jsp?id=<%=pid%>">Delete</a></td>
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