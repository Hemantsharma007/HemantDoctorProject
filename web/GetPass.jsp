<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
				<li><a href="Services.jsp">Service</a></li>
				<li><a href="ViewDoctors.jsp">Doctors</a></li>
                                <li><a href="About.jsp">About Us</a></li>
				<li style='margin-top: 12px;background-color: white;'><div class="dropdown">
  <button style='background-color:khaki;color:black;' class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Sign Up
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="#">Patient Sign Up</a></li>
    <li><a href="#">Doctor Sign Up</a></li>
  </ul>
                                    </div></li>
                                    <li style="margin-left: 15px; margin-top: 12px;"><div class="dropdown">
  <button style='background-color:khaki;color:black;' class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Login
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
      <li><a href="PatientLogin.jsp">Patient Login</a></li>
    <li><a href="DoctorLogin.jsp">Doctor Login</a></li>
  </ul>
                                    </div></li>
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
                                                <center><img src="images/Password.jpg" height="130px" width="510px"></center><hr>
                                                <center>
                                                    <%
   try
   {
        String  Name = request.getParameter("name");
        String  email = request.getParameter("email");
        //out.println(Name+" "+email);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
       PreparedStatement ps = con.prepareStatement("select Pass from Table_Patient where  Pname=? and Email=? ");
        ps.setString(1, Name);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        if(!rs.next())
        {
            out.println("<center><h3>Sorry! Patient Name or Patient Email-ID does not match.</h3></center>");
            out.println("<hr><center><a href='ForgotPass.jsp'>Try Again</a></center>");
        }
        else
        {
            String   pwd = rs.getString("Pass");
            out.print("<center><h3>Your Password is&nbsp= &nbsp;&nbsp;"+pwd+"</h3></center>");
            out.println("<hr><center><a href='PatientLogin.jsp'>Login Now</a></center>");
        }
   }
    catch(Exception e)
    {
        out.print(e);
    }
%>
                                                </center>
                                                
                                            </div>
                                            
                                                        
                                        </div></div></div>
                                                        
							</div>	
					</div>		
	
    </section>
    
</body>

</html>