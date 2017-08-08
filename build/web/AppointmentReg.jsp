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
    </head>
    <body>
       <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs1,rs2,rs3;  
            Statement st1,st2,st3;
            String deparmentName,doctorName,doctorFees;
        %>
       <%
           String s=null;
           String id=(String)session.getAttribute("pid");
           String name=(String)session.getAttribute("pname");
           String dept=request.getParameter("department");
           String doctor=request.getParameter("doctor");
           String fees=request.getParameter("fees");
           String date=request.getParameter("date");
           String time=request.getParameter("time");
           
           try
           {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
           st1=con.createStatement();
           rs1=st1.executeQuery("select * from dept where deptid="+dept+"");
           while(rs1.next())
           {
               deparmentName=rs1.getString("deptName");
           }
           //out.println(deparmentName);
           st2=con.createStatement();
           rs2=st2.executeQuery("select * from doctor where docid="+doctor+"");
           while(rs2.next())
           {
               doctorName=rs2.getString("name");
           }
          // out.println(doctorName);
           st3=con.createStatement();
           rs3=st3.executeQuery("select * from doctorfees where feesid='"+fees+"'");
           while(rs3.next())
           {
               doctorFees=rs3.getString("dfees");
           }
          // out.println(doctorFees);
           ps=con.prepareStatement("insert into Table_Appointment values (?,?,?,?,?,?,?,?)");
           ps.setString(1,id);
           ps.setString(2,name);
           ps.setString(3,deparmentName);
           ps.setString(4,doctorName);
           ps.setString(5,doctorFees); 
           ps.setString(6,date);
           ps.setString(7,time);
           ps.setString(8,s);
           int i=ps.executeUpdate();
           if(i>0)
           {
               response.sendRedirect("AppointmentSubmitted.jsp");
                
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
