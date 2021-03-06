<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
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
                                <li><a href="Contact.jsp">Contact Us</a></li>
                                    
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
                                                <center><img src="images/About.png" width="510px"></center><hr>
                                                <b>Hospital Management</b>
                                                <p>When it comes to choosing a hospital, one thing is clear: quality counts. 
                                                    And a century-long tradition of providing medical care in a comfortable and convenient environment 
                                                    means peace of mind for the thousands of patients who are cared for by the doctors and 
                                                    nurses at the Demo Hospital each year.</p>
                                                       <b>A Tradition of Quality</b> 
                                                       <p>
                                                           Since July 2017, The Demo Hospital has been jointly owned and operated by a partnership 
                                                           between XYZ and a subsidiary of Universal Health Services Inc. PA-based company that 
                                                           is one of the nation's largest health care management companies. Under the terms of this 
                                                           partnership, named The District Hospital Partners, ABC, PQR holds an 80 percent 
                                                           interest and the University holds a 20 percent interest.
                                                       </p>
                                            <b>Mission</b> 
                                            <p>
                                                The mission of The Demo Hospital is to provide the highest quality health care, advanced technology 
                                                and world class service to our patients in an academic 
                                                medical center dedicated to education and research.
                                            </p>
                                            <b>Vision</b> 
                                            <p>
                                                Together, we will pursue our passion for healing, discovering medical breakthroughs and 
                                                improving lives. While developing tomorrow's leaders, we will earn our community's
                                                trust and recognition as the first choice for complex medical care. 
                                            </p>
                                            <b>Principles</b> 
                                            <p>We realize this vision through our commitment to the following principles:</p>
                                    <ul style="list-style-type: circle;color: red;">                                        
                                        <li><b>Service excellence.</b></li>
                                        <li><b>Quality improvement.</b></li>
                                        <li><b>Employee development.</b></li>
                                        <li><b>Ethical and fair treatment.</b></li>
                                        
                                    </ul>
                                            <b>Accreditation</b> 
                                            <p>
                                               The hospital is accredited by The Joint Commission and licensed by the District of Thane, Maharashtra Regulatory Affairs Department.
                                            </p>
                                            
                                            </div>
                                            
                                                        
                                        </div></div></div>
                                                        
							</div>	
					</div>		
	
    </section>
    
</body>

</html>
