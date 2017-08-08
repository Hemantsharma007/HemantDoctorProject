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
           String name=(String)session.getAttribute("pname");
           String service=request.getParameter("service");
           String point=request.getParameter("point");
           String nature=request.getParameter("nature");
           String loc=request.getParameter("hloc");
           String feedback=request.getParameter("feedback");
           //String date=request.getParameter("date");
           Date d = new Date();
           SimpleDateFormat s = new SimpleDateFormat();
           String date = s.format(d);
           try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
           ps=con.prepareStatement("insert into Table_Feedback values (?,?,?,?,?,?,?)");
           ps.setString(1,name);
           ps.setString(2,service);
           ps.setString(3,point); 
           ps.setString(4,nature);
           ps.setString(5,loc);
           ps.setString(6,feedback);
           ps.setString(7,date);
           int i=ps.executeUpdate();
           if(i>0)
           {
                 response.sendRedirect("FeedbackSubmitted.jsp");
                 //out.println("<h1>Registration Suucessful...</h1>");
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
