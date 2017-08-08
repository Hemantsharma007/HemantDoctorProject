<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Hospital Management System</title>
	
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet"/>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
	<!-- template skin -->
	<link id="t-colors" href="css/default.css" rel="stylesheet">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
<%
    
%>

<div id="wrapper">
	
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

        <div class="container navigation">
		
            <div class="navbar-header page-scroll">
                    <a class="navbar-brand" href="index.html">
                        <img src="images/logo.png" alt="logo" style="border: 2px solid black; margin-left: -45px !important ;margin-right: 70px !important; border-width: 6px; background: #dddddd; margin-right: 45px; padding: 10px 40px;border-radius: 25px;"  width="450" height="120""  />
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse" style="margin-top:-45px;">
               
			  <ul class="nav navbar-nav">
				<li class="active"><a href="index.html">Home</a></li>
				<li><a href="ViewProfile.jsp">View Profile</a></li>
                                <li><a href="BookApointment.jsp">Book Appointment</a></li>
                                <li><a href="PayBill.jsp">Pay Bill</a></li>
                                <li><a href="FeedbackForm.jsp">Feedback</a></li>
                                <li><a href="Logout.jsp">Logout</a></li>
                                 
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
						<img src="images/img-1.png" class="img-responsive" alt="" />
						</div>
					</div>	
                                    <div class="col-lg-6">
                                             
                                            <div class="panel-body" style="">
                                                 <center><%
                String id = (String) session.getAttribute("pid");
                String name = (String) session.getAttribute("pname");
                out.println("Welcome"+"&nbsp;&nbsp;&nbsp;");
                out.println("<b>"+name+"</b>");
                out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;"+"["+id+"]</b>");
                %></center>
                                                <center><img src="images/patient.jpg" width="510px"></center><hr>
                                                <center><h1>Welcome To Patient Zone.</h1></center>
                                            </div></div>
					
    </section>
    
</body>

</html>
