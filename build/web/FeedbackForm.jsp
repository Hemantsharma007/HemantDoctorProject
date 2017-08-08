<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

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
				<li><a href="Services.jsp">Services</a></li>
				<li><a href="ViewDoctors.jsp">Doctors</a></li>
                                <li><a href="About.jsp">About Us</a></li>
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
						<img src="images/img-1.png" class="img-responsive" alt="" />
						</div>
					</div>	
					<div class="col-lg-6">
                                             
                                            <div class="panel-body" style="">
                                            <center><h3>Feedback Form</h3></center><hr>
							
                                            <form action="FeedbackReg.jsp" method="post" role="form" class="contactForm lead">
    										<div class="row">
    											<div class="col-xs-6 col-sm-6 col-md-6">
    												<div class="form-group">
    													<label>How was our Services?</label>
                                                                                                        <select name="service" class="form-control">
                                                                                                            <option selected="" value="-1" disabled="">Select Choice</option>
                                                                                                            <option>Good</option>
                                                                                                            <option>Excellent</option>
                                                                                                            <option>Average</option>
                                                                                                            <option>Poor</option>
                                                                                                            <option>Very Poor</option>
                                                                                                        </select>
                                                        <div class="validation"></div>
    												</div>
    											</div>
    											<div class="col-xs-6 col-sm-6 col-md-6">
    												<div class="form-group">
    													<label>Give your point to our Services.</label>
                                                                                                        <select name="point" class="form-control">
                                                                                                            <option selected="" value="-1" disabled="">Select Choice</option>
                                                                                                            <option>1</option>
                                                                                                            <option>2</option>
                                                                                                            <option>3</option>
                                                                                                            <option>4</option>
                                                                                                            <option>5</option>
                                                                                                        </select>
                                                        <div class="validation"></div>
    												</div>
    											</div>
                                                                                    
                                                       <div class="col-xs-6 col-sm-6 col-md-6">
    												<div class="form-group">
    													<label>How was our Doctor nature?</label>
                                                                                                        <select name="nature" class="form-control">
                                                                                                            <option selected="" value="-1" disabled="">Select Choice</option>
                                                                                                            <option>Good</option>
                                                                                                            <option>Excellent</option>
                                                                                                            <option>Average</option>
                                                                                                            <option>Poor</option>
                                                                                                            <option>Very Poor</option>
                                                                                                        </select>
                                                        <div class="validation"></div>
    												</div>
    							</div>
                                                        <div class="col-xs-6 col-sm-6 col-md-6">
    												<div class="form-group">
    													<label>Preferred Hospital Location</label>
                                                                                                        <input type="text" name="hloc" id="first_name" class="form-control input-md" title="Enter Contact No.">
                                                        <div class="validation"></div>
    												</div>
    							</div>
                                                                                    <div class="col-xs-6 col-sm-6 col-md-6">
    												<div class="form-group">
    													<label>Feedback</label>
                                                                                                        <textarea  required rows="3" cols="45" name="feedback"></textarea>
                                                        <div class="validation"></div>
    												</div>
                                                        </div>
                                                    
                                                                                </div>
                                            
    										<input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
    									</form>
                                                         
                                            </div>
                                                       
                                        </div></div></div>
                                                        
							</div>	
					</div>			
    </section>
    
</body>

</html>
