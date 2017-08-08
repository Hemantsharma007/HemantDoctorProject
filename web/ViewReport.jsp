<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%!
            Connection con;
            Statement st, st1, st2, st3, st4,st5,st6,st7,st8,st9,st10,st11;
            ResultSet rs;
            String dname, pid, bill, pname, name,s, disease,email,room, gender, adate,age,id;
        %>
<%
                                                        id = (String) session.getAttribute("pid");
                                                        name = (String) session.getAttribute("pname");
                                                        try {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                            st = con.createStatement();
                                                            rs = st.executeQuery("select Pid from Patient_Bill where Pname='"+name+"'");
                                                            if (!rs.next()) {
                                                                out.println("<center><h1>You have Not Fixed any Appointment with any  Doctor Therefore no report is generated.</h1></center>");
                                                            } else {
out.println("<div class='container-fluid' style='padding:0px;'><div class='table-responsive'><table border='3' class='table table-striped'>");
out.println("<tr><th>PID</th><th>Name</th><th>Email</th><th>Gender</th><th>Age</th><th>Consultant Doctor</th><th>Disease Name</th><th>Room Type</th><th>Admit Date</th><th>Discharge Date</th><th>Bill Amount</th></tr>");
                                                                rs = st.executeQuery("select Pid from Patient_Bill where Pname='"+name+"'");
                                                                while (rs.next()) {
                                                                    pid = rs.getString("Pid");
                                                                }
                                                              
                                                                st1 = con.createStatement();
                                                                rs = st1.executeQuery("select Pname from Patient_Bill where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    pname = rs.getString("Pname");
                                                                }
                                                               
                                                                st2 = con.createStatement();
                                                                rs = st2.executeQuery("select Email from Table_Patient where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    email = rs.getString("Email");
                                                                    
                                                                }
                                                              
                                                                st3 = con.createStatement();
                                                                rs = st3.executeQuery("select Gender from Table_Patient where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    gender = rs.getString("Gender");

                                                                }
                                                                
                                                                st4 = con.createStatement();
                                                                rs = st4.executeQuery("select Age from Table_Patient where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    age = rs.getString("Age");

                                                                }
                                                                
                                                                st5 = con.createStatement();
                                                                rs = st5.executeQuery("select Dname from Patient_Bill where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    dname = rs.getString("Dname");
                                                                }
                                                                
                                                               
                                                                st6 = con.createStatement();
                                                                rs = st6.executeQuery("select Disease from Patient_Bill where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    disease = rs.getString("Disease");
                                                                }
                                                              
                                                                st7 = con.createStatement();
                                                                rs = st7.executeQuery("select RoomType from Table_Patient where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    room = rs.getString("RoomType");
                                                                }
                                                               
                                                                st8 = con.createStatement();
                                                                rs = st8.executeQuery("select Reg_Date  from Table_Patient where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                   adate = rs.getString("Reg_Date");
                                                                }
                                                                Date date = new Date();
                                                                SimpleDateFormat sdf = new SimpleDateFormat();
                                                                s = sdf.format(date);
                                                              
                                                                st9 = con.createStatement();
                                                                rs = st9.executeQuery("select BillAmount from Patient_Bill where Disease='"+disease+"'");
                                                                while (rs.next()) {
                                                                    bill = rs.getString("BillAmount");
                                                                    
                                                                }
                                                                
out.println("<tr><td>"+pid+"</td><td>"+pname+"</td><td>"+email+"</td><td>"+gender+"</td><td>"+age+"</td><td>"+dname+"</td><td>"+disease+"</td><td>"+room+"</td><td>"+adate+"</td><td>"+s+"</td><td>"+bill+"</td></td></tr>");
Class.forName("com.mysql.jdbc.Driver");
                                                                
                                                                // int i=st10.executeUpdate("insert into Report (Pid,Pname,Email,Gender,Age,Dname,Disease,RoomType,Admit_Date,Discharge_Date,Total_Bill) values('"+pid+"','"+pname+"','"+email+"','"+gender+"','"+age+"','"+dname+"','"+disease+"','"+room+"','"+adate+"','"+s+"','"+bill+"')");
                                                            }
                                                        }
                                                         catch (Exception e) 
                                                         {
                                                             ///e.getMessage();
                                                            /// e.printStackTrace();
                                                          //out.println(e);
                                                        }
                                                    %>
</table></div></div>
<center>
    <a href="index.html">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="PatientHome.jsp">Patient Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>
</center>
<a href="InsertReports.jsp?id=<%=pid%>&name=<%=pname%>&email=<%=email%>&gender=<%=gender%>&age=<%=age%>&dname=<%=dname%>&disease=<%=disease%>&room=<%=room%>&admit_date=<%=adate%>&discharge_date=<%=s%>&bill=<%=bill%>"></a>
</body>
</html>