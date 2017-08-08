<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap.min.js"></script>
    </head>
<body>
<%
String fees=request.getParameter("count");  
 String buffer="<select name='fees' class='form-control'><option value='-1'>Doctor Fees</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from doctorfees where docid='"+fees+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString("feesid")+"'>"+rs.getString("dfees")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>
 </body>
</html>