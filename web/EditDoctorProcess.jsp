<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
Connection conn;
Statement st;
ResultSet rs;
%>
<% 
try
{
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	//out.println(id);
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	String contact=request.getParameter("phone");
	String fees=request.getParameter("fees");
        String gender=request.getParameter("gender");
	String age=request.getParameter("age");
	String dept=request.getParameter("Department");
        String address=request.getParameter("address");
        String degree=request.getParameter("degree");
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=conn.createStatement();
	int i=st.executeUpdate("update Table_Doctor set  Dname='"+name+"',Email='"+email+"',Pass='"+pass+"',Contact='"+contact+"',Gender='"+gender+"',Age='"+age+"',fees='"+fees+"',Address='"+address+"',Department='"+dept+"',Degree='"+degree+"' where Did='"+id+"'");
	response.sendRedirect("DoctorProfile.jsp");
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>