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
           String pid=request.getParameter("id");
           String pname=request.getParameter("name");
           String email=request.getParameter("email");
           String gender=request.getParameter("gender");
           String age=request.getParameter("age");
           String dname=request.getParameter("dname");
           String disease=request.getParameter("disease");
           String room=request.getParameter("room");
           String adate=request.getParameter("admit_date");
           String ddate=request.getParameter("discharge_date");
           String bill=request.getParameter("bill");
           try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
           ps=con.prepareStatement("insert into Report values (?,?,?,?,?,?,?,?,?,?,?)");
           ps.setString(1,pid);
           ps.setString(2,pname);
           ps.setString(3,email); 
           ps.setString(4,gender);
           ps.setString(5,age);
           ps.setString(6,dname);
           ps.setString(7,disease);
           ps.setString(3,room); 
           ps.setString(4,adate);
           ps.setString(5,ddate);
           ps.setString(6,bill);
           int i=ps.executeUpdate();
           if(i>0)
           {
                 response.sendRedirect("ViewReport.jsp");
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
