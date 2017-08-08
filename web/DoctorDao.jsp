<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
    String Name,id;
        %>
      <%
          try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
            Name=request.getParameter("Doctor_name");
            String pass=request.getParameter("Password");
            id=request.getParameter("did");
            String sql="select * from Table_Doctor where Dname='"+Name+"' and Did='"+id+"' and Pass='"+pass+"' ";
            Statement st=con.createStatement();
            rs=st.executeQuery(sql);
            if (rs.next()) 
            {       
                response.sendRedirect("DoctorHome.jsp");
            }
            else 
            {
               response.sendRedirect("InvalidPassword.jsp");  
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        session.setAttribute("dname", Name);
        session.setAttribute("did", id);
      %>
    </body>
</html>
