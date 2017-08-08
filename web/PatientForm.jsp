<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
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
        <script type="text/javascript">
        function check(){
    if((frm.phone.value).length !=10)
{
	alert("Phone Number should be 10 digit only.");
	return false;
}
}
        </script>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
        %>

        <div id="wrapper">

            <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

                <div class="container navigation">

                    <div class="navbar-header page-scroll">
                        
                            <a class="navbar-brand" href="index.html">
                                <img src="images/logo.png" alt="logo" style="border: 2px solid black; border-width: 6px; background: #dddddd; padding: 10px 40px;border-radius: 25px;" width="450" height="120" />
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
            <section id="intro" class="intro" width="60%" height="200px">
                <div class="intro-content">
                    <div class="container" >
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img-responsive" alt=""  style="margin-top: 0px;"/>
                                </div>
                            </div>	
                            <div class="col-lg-6">

                                <div class="panel-body" style="margin-top: 0px;">
                                    <center><h6>Patient Registration Form</h6></center><hr>

                                    <form action="PatientRegistration.jsp" method="post" name="frm" role="form" class="contactForm lead">
                                        <div class="row" style="margin-top: 0px;">
                                            <div class="col-xs-6 col-sm-6 col-md-6" style="margin-top: 0px;">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                        Random random = new Random();
                                                            Set<Integer> randomNumbers = new HashSet<>();
                                                            while(randomNumbers.size() <1)
                                                                randomNumbers.add( new Integer(random.nextInt(999) + 100) );
                                                            for(Integer randomNumber : randomNumbers){
                                                                out.println("PID- "+randomNumber);
                                                            }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name" id="last_name" class="form-control input-md" required="" title="Patient name can not be blank and should not contain any digit.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" placeholder="me@example.com" id="last_name" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" name="phone" id="first_name" class="form-control input-md" required="" title="Phone no. should not contain any alaphabets.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient DOB</label>
                                                    <input type="date"  name="dob" id="last_name" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select name="gender" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                        <option>Other</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="number"  name="age" id="last_name" class="form-control input-md" required="" title="Age should not contain any alaphabets.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select name="status" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Status</option>
                                                        <option>Married</option>
                                                        <option>Divorced</option>
                                                        <option>Single</option>
                                                        <option>Widow</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" required rows="2" cols="20" name="address"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Disease</label>
                                                    <select name="disease" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Disease</option>
                                                        <option value="Normal Diseases">Normal Diseases</option> 
                                                        <option value="Cancer">Cancer</option> 
                                                        <option value="Celiac Disease">Celiac Disease</option> 
                                                        <option value="Heart Disease">Heart Disease</option> 
                                                        <option value="Crohn's & Colitis">Crohn's & Colitis</option> 
                                                        <option value="Infectious Diseases">Infectious Diseases</option> 
                                                        <option value="Liver Disease">Liver Disease</option> 
                                                        <option value="Big Diseases">Big Diseases</option> 
                                                        <option value="Private Diseases">Private Diseases</option> 
                                                        <option value="Ear, Nose and Throat Diseases">ENT Diseases</option>
                                                        <option value="Other Diseases">Other Diseases</option>    
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Room Type</label>
                                                    <select name="room" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Room Type</option>
                                                        <option value="Normal">Normal</option> 
                                                        <option value="Medium">Medium</option> 
                                                        <option value="V.I.P">V.I.P</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                </div>
                                                    <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg" onclick="return check();">
                                </form>
                                <center>
                                    <a href="ForgotPass.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="PatientLogin.jsp">Login Here</a>
                                </center><hr>
                            </div></div></div>

                </div>	
        </div>		

    </section>
</body>

</html>
