
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
                            <li><a href="Services.jsp">Services</a></li>
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
                                    <img src="images/img-1.png" class="img-responsive" alt="" />
                                </div>
                            </div>	
                            <div class="col-lg-6">

                                <div class="panel-body" style="">
                                    <center><h3>Contact Us</h3></center><hr>

                                    <form action="ContactDao" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>User Name</label>
                                                    <input type="text" name="uname" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" id="last_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" name="phone" id="last_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Our Address</label>
                                                    <textarea disabled=""  rows="3" cols="20" name="address">F-2 Plot no 13 Sultanpur New Delhi 110030
                                                 Contact us +91-8882908888</textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Comment</label>
                                                    <textarea required rows="3" cols="40" name="comment"></textarea>
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
