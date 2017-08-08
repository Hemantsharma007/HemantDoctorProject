<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>

    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap.min.js"></script>
    </head>

<%
int deptid=0;
String dept=request.getParameter("count");  
String buffer="<input type='text' name='stream' id='stream' class='form-control input-md' onchange='showStream(this.value); required>";  
 try
 {
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select Deptid from Table_Doctor where Department='"+dept+"' ");  
   while(rs.next()){
        deptid=rs.getInt("Deptid");
   }
    buffer=buffer+"<input type='text' name='stream' id='stream'  value='"+deptid+"' class='form-control input-md'"; 
    response.getWriter().println(buffer); 
    buffer=buffer+"</>";
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>

