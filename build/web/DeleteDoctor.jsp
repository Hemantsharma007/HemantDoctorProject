<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=conn.createStatement();
	int i=st.executeUpdate("delete from Table_Doctor where Did='"+id+"'");
	response.sendRedirect("DoctorsList.jsp");
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>
