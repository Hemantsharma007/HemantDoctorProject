<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;>
<title>Insert title here</title>
</head>
<body>
<%!
Connection conn;
Statement st,st1,st2,st3;
ResultSet rs;
%>

<% 
try
{
	String id=request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
	st=conn.createStatement();
	int i=st.executeUpdate("delete from Table_Patient where Pid='"+id+"'");
        st1=conn.createStatement();
        int j=st1.executeUpdate("delete from Table_Appointment where Pid='"+id+"'");
        st2=conn.createStatement();
        int k=st2.executeUpdate("delete from Patient_Bill where Pid='"+id+"'");
	response.sendRedirect("ViewAPatients.jsp");
}
catch(Exception e)
{
	out.println(e);
}
%>

</body>
</html>
