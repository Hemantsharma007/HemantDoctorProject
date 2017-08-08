<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%!
            Connection con;
            Statement st;
            ResultSet rs;
            String dname, pid,bill,pname,name,name1,id;
        %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
	
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
	<!-- template skin -->
	<link id="t-colors" href="css/default.css" rel="stylesheet">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
<div id="wrapper">
	
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

        <div class="container navigation">
		
            <div class="navbar-header page-scroll">
               
                <a class="navbar-brand" href="index.html">
                    <a class="navbar-brand" href="index.html">
                        <img src="images/logo.png" alt="logo" style="border: 2px solid black; border-width: 6px; background: #dddddd; padding: 10px 40px;border-radius: 25px;" width="450" height="120" />
                </a>
                
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
				<li class="active"><a href="index.html">Home</a></li>
				<li><a href="ViewDoctors.jsp">Doctors</a></li>
                                <li><a href="About.jsp">About Us</a></li>
                                <li><a href="FeedbackForm.jsp">Feedback</a></li>
                                <li><a href="Logout.jsp">Logout</a></li>                                  
			  </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="intro-content">
			<div class="container">
				<div class="row">
				<div class="col-lg-6">
						<div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
						<img src="images/hospital.jpg" class="img-responsive" alt="" />
						</div>
					</div>	
					<div class="col-lg-6">
                                             
                                            <div class="panel-body" style="">
                                                <center><img src="images/appointments.jpg" height="230px" width="510px"></center><hr>
                                                
                                                    <%
                                                            id=(String)session.getAttribute("did");
                                                            name1=(String)session.getAttribute("dname");
                                                           //out.println(id+" "+name1);
                                                            try {
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st = con.createStatement();
                                                                rs = st.executeQuery("select Pid,Pname from Table_Appointment where Dname='"+name1+"'");
                                                                if(!rs.next())
                                                                {
                                                                    %> 
                                                                    <center><h1>No Appointment is Fixed With You.</h1></center>
                                                                    <%
                                                                }
                                                                else
                                                                {
                                                                    rs = st.executeQuery("select Pid,Pname from Table_Appointment where Dname='"+name1+"'");
                                                                while (rs.next()) {
                                                                   pid = rs.getString("Pid");
                                                                   name = rs.getString("Pname");
                                                        %>         
                                                        <center><b><%=name%></b>[<b><%=pid%></b>] &nbsp;&nbsp;&nbsp;Have fixed a appointment with you.</center>
                                                        <center><a style="color:red;" href="ViewDoctorAppointment.jsp?id=<%=pid%>">View Appointment</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:red;" href="CancelAppointment.jsp?id=<%=pid%>">Cancel Appointment</a><hr></center>
                                                        <%
                                                                }
                                                                    }
                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }

                                                        %>
                                            </div> </div></div></div>
							</div>	
					</div>		
</section>
    
</body>

</html>

