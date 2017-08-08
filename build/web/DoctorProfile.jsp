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
String name,email,gender,pass,age,Reg_Date,contact,dob,fees,did,degree,address,dept;
%>
<div class="container-fluid" style="padding:0px;">
<div class="table-responsive"> 
<table border="3" class="table table-striped">
<tr>
<th>DID</th><th>Doctor Name</th><th>Email</th><th>Password</th><th>Gender</th><th>Age</th><th>Degree</th><th>Department</th><th>Fees</th><th>Contact</th><th>Address</th><th>Registered Date</th><th>Action</th>
</tr>
<%
try
{
        String id=(String)session.getAttribute("did");
        //out.println(id);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=con.createStatement(); 
	rs=st.executeQuery("select * from Table_Doctor where Did='"+id+"'");
	while(rs.next())
	{
		did=rs.getString("Did");
		name=rs.getString("Dname");
		email=rs.getString("Email");
                pass=rs.getString("Pass");
                gender=rs.getString("Gender");
                age=rs.getString("Age");
		degree=rs.getString("Degree");
		dept=rs.getString("Department");
                fees=rs.getString("fees");
		contact=rs.getString("Contact");
		address=rs.getString("Address");
		Reg_Date=rs.getString("Reg_Date");
%>
<tr>
	<td><%=id%></td><td><%=name%></td><td><%=email%></td><td><%=pass%></td><td><%=gender%></td><td><%=age%></td><td><%=degree%><td><%=dept%><td><%=fees%><td><%=contact%><td><%=address%></td><td><%=Reg_Date%></td>
	<td><a href="EditDoctor.jsp?id=<%=id%>">Edit</a>&nbsp;&nbsp;&nbsp;<a href="DeleteDoctor.jsp?id=<%=did%>"></a></td>
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
<center><a href="index.html">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="DoctorHome.jsp">Back</a></center>
</body>
</html>