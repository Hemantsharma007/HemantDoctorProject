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
           String id=request.getParameter("pid");
           String name=request.getParameter("pname");
           String dname=request.getParameter("dname");
           String disease=request.getParameter("disease");
           String amount=request.getParameter("amount");
           try
           {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
           ps=con.prepareStatement("insert into Patient_Bill values (?,?,?,?,?)");
           ps.setString(1,id);
           ps.setString(2,name);
           ps.setString(3,dname);
           ps.setString(4,disease);
           ps.setString(5,amount); 
           int i=ps.executeUpdate();
           if(i>0)
           {
               response.sendRedirect("BillPaid.jsp");
                
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
