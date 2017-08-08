<%@page import="com.lib.dao.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    </head>
    <body>
       <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;    
        %>
       <%
           
           String name=request.getParameter("uname");
           String email=request.getParameter("email");
           String contact=request.getParameter("phone");
           String comment=request.getParameter("comment");
           //String date=request.getParameter("date");
           
           try{
           con=DB.getConnection();
           ps=con.prepareStatement("insert into Table_Contact(Name,Email,Contact,Comment) values (?,?,?,?)");
           ps.setString(1,name);
           ps.setString(2,email);
           ps.setString(3,contact); 
           ps.setString(4,comment);
           
           int i=ps.executeUpdate();
           if(i>0)
           {
                 response.sendRedirect("ContactSubmitted.jsp"); 
           }
           else
           {
               out.println("<h1>Somethong Went Wrong Try Again...</h1>");
           }
           }
        catch(Exception e)
        {
            out.print(e);
        }
       %>
    </body>
</html>
