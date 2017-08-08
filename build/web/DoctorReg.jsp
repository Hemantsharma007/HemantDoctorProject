<%@page import="java.sql.Statement"%>
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
            String id,dname;
            ResultSet rs,rs1,rs2,rs3;  
            Statement st1,st2,st3;
            int deparmentID;
            String doctorFees,deparmentName;
            
        %>
       <% 
           id=request.getParameter("did");
           dname=request.getParameter("name");
           String email=request.getParameter("email");
           
           String pass=request.getParameter("pass");
           String d_gender=request.getParameter("gender");
           int did=Integer.parseInt(request.getParameter("doctor"));
           String degree=request.getParameter("degree");
           String dept=request.getParameter("department");
           String fees=request.getParameter("fees");
           String d_address=request.getParameter("address");
           String phone=request.getParameter("phone"); 
           int age=Integer.parseInt(request.getParameter("age"));
           Date d = new Date();
           SimpleDateFormat s = new SimpleDateFormat();
           String date = s.format(d);
           try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
           st2=con.createStatement();
           rs2=st2.executeQuery("select * from dept where deptid="+dept+"");
           while(rs2.next())
           {
               deparmentName=rs2.getString("deptName");
           }
           st1=con.createStatement();
           rs1=st1.executeQuery("select * from dept where deptName='"+deparmentName+"'");
           while(rs1.next())
           {
               deparmentID=rs1.getInt("deptid");
           }
           //out.println(deparmentName);
           
           st3=con.createStatement();
           rs3=st3.executeQuery("select * from doctorfees where feesid='"+fees+"'");
           while(rs3.next())
           {
               doctorFees=rs3.getString("dfees");
           }
           ps=con.prepareStatement("insert into Table_Doctor values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
           ps.setString(1,id);
           ps.setString(2,dname);
           ps.setString(3,email);
           ps.setString(4,pass);
           ps.setString(5,d_gender); 
           ps.setString(6,degree);
           ps.setString(7,deparmentName);
           ps.setString(8,doctorFees);
           ps.setString(9,phone);
           ps.setString(10,d_address);
           ps.setString(11,date);
           ps.setInt(12,deparmentID);
           ps.setInt(13,age);
           int i=ps.executeUpdate();
           if(i>0)
           {
                response.sendRedirect("DoctorHome.jsp");
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
       <%
            session.setAttribute("dname",dname);
            session.setAttribute("did",id);
            //session.setAttribute("pemail",email);
        %>
    </body>
</html>
