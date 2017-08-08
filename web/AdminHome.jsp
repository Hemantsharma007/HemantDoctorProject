<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li><a href="ViewAPatients.jsp">Patients</a></li>
                            <li><a href="DoctorsList.jsp">Doctors</a></li>
                            <li><a href="ViewFeedback.jsp">Feedbacks</a></li>
                            <li><a href="ViewAppointment.jsp">Appointments</a></li>
                            <li style='margin-top: 12px;background-color: white;'><div class="dropdown">
                                    <button style='background-color:whitesmoke;color:black;' class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Add
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="AddPatient.jsp">Add Patient</a></li>
                                        <li><a href="AddDoctor.jsp">Add Doctor</a></li>
                                    </ul>
                                </div></li>
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
                                </div>   </div>
                            <div class="col-lg-6">

                                <div class="panel-body" style="">
                                    <center><img src="images/admin.jpg" height="130px" width="510px"></center><hr>
                                    <center><h6>Admin: Hemant Sharma</h6></center><hr>

                                    <b>Patient Management</b> 
                                    <p>
                                        Here Hemant Sharma can View,Add and Remove the already added Patients Details.
                                        Administrator can also add a new Patient for a particular test 
                                        under this section.
                                    </p>
                                    <b>Doctor Management</b> 
                                    <p>
                                        Here Hemant Sharma can View,Add and Remove the already added Doctors Details.
                                        Administrator can also add a new Doctor for a particular test 
                                        under this section.
                                    </p>
                                    <b>Appointment Management</b> 
                                    <p>
                                        Here Hemant Sharma can View,Add and Remove the already added Appointment Details.
                                        Administrator can also add a new Appointment for a particular test 
                                        under this section.
                                    </p>
                                    <b>Feedback Management</b> 
                                    <p>
                                        Here Hemant Sharma can View the already added Feedback Details.
                                        Administrator can also add a new Feedback for a particular test 
                                        under this section.
                                    </p>
                                    <hr>
                                    <center>
                                        <a href="Logout.jsp">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ViewPaidBills.jsp">View Paid Bills</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ViewReports.jsp">View Patient Reports</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ViewContacts.jsp">View Contacts</a>
                                    </center>
                                </div>



                            </div>	</div></div></div>					
            </section>

    </body>

</html>
