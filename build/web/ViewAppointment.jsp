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
        <%!
            Connection con;
            Statement st;
            String name,id,s4,s5,s6,s7,s8,s1,s2;
            %>
       <%
     try
     {
         name =(String)session.getAttribute("name");
         id=(String)session.getAttribute("pid");   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select Pid,Pname,Department,Dname,Fees,App_Date,App_Time from Table_Appointment");
    %>
<div class="container-fluid" style="padding:0px;">
<div class="table-responsive"> 
<table border="3" class="table table-striped">
    <tr>
    <th>Patient Name</th><th>Patient ID</th><th>Doctor Department</th><th>Doctor Name</th><th>Doctor Fees</th><th>Appointment Date</th><th>Appointment Time</th>
  </tr>
    <%
    while(rs.next())
    {
         id=rs.getString("Pid");
         name=rs.getString("Pname");
         s4=rs.getString("Department");
         s5=rs.getString("Dname");
         s6=rs.getString("Fees");
         s7=rs.getString("App_Date");
         s8=rs.getString("App_Time");
  
    %>
    
    <tr><td><%=name%></td><td><%=id%></td><td><%=s4%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td><td><%=s8%></td></tr>  
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
