<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
<%!
Connection con;
PreparedStatement ps;
Statement st;
ResultSet rs;
String name,dname,pid,bill,disease,room,gender,age,email,adate,ddate;
%>
<div class="container-fluid" style="padding:0px;">
<div class="table-responsive"> 
<table border="3" class="table table-striped">
<tr>
<th>PID</th><th>Name</th><th>Email</th><th>Gender</th><th>Age</th><th>Consultant Doctor Name</th><th>Disease Name</th><th>Room Type</th><th>Admit Date</th><th>Discharge Date</th><th>Total Bill</th>
</tr>
<%
try
{
        String id=(String)session.getAttribute("pid");
        //out.println(id);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat();
        adate = sdf.format(date);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=con.createStatement(); 
	rs=st.executeQuery("select b.Pid, b.Pname, b.Dname, b.Disease,b.BillAmount,p.Email,p.Gender,p.Age,p.RoomType,p.Reg_Date from Patient_Bill b INNER JOIN  Table_Patient p ON b.Pid=p.Pid");
	while(rs.next())
	{
		pid=rs.getString("Pid");
		name=rs.getString("Pname");
		dname=rs.getString("Dname");
                disease=rs.getString("Disease");
                bill=rs.getString("BillAmount");
                email=rs.getString("Email");
                age=rs.getString("Age");
                room=rs.getString("RoomType");
                gender=rs.getString("Gender");
                ddate=rs.getString("Reg_Date");
                ddate=rs.getString("BillAmount");
%>
<tr>
    <td><%=pid%></td><td><%=name%></td><td><%=email%></td><td><%=gender%></td><td><%=age%></td><td><%=dname%></td><td><%=disease%></td><td><%=room%><td><%=ddate%></td><td><%=adate%></td></td><td><%=bill%></td>
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