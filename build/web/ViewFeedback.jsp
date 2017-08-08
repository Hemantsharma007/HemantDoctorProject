<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
       <%
     try
     {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select Name,Services,Points,Doc_Nature,Location,Feedback,Reg_Date from Table_Feedback");
    %>
<div class="container-fluid" style="padding:0px;">
<div class="table-responsive"> 
<table border="3" class="table table-striped">
    <tr>
    <th>Name</th><th>Services</th><th>Points</th><th>Doctor Nature</th><th>Preferred Hospital Location</th><th>Feedback</th><th>Feedback Date</th>
  </tr>
    <%
    while(rs.next())
    {
        String s1=rs.getString("Name");
        String s2=rs.getString("Services");
        String s3=rs.getString("Points");
        String s4=rs.getString("Doc_Nature");
        String s5=rs.getString("Location");
        String s6=rs.getString("Feedback");
        String s7=rs.getString("Reg_Date");

    %>
    
    <tr><td><%=s1%></td><td><%=s2%></td><td><%=s3%></td><td><%=s4%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td></tr>  
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
