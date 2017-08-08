<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            Statement st;
            String name, email, gender, pass, age, contact, dob, dept, did, fees, address, degree;
        %>
        <%
            try {
                String id = request.getParameter("id");
                out.println(id);
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                st = con.createStatement();
                rs = st.executeQuery("select Did,Dname,Email,Pass,Contact,Age,Gender,Fees,Degree,Address,Department from Table_Doctor where Did='" + id + "'");
                while (rs.next()) {
                    did = rs.getString("Did");
                    name = rs.getString("Dname");
                    email = rs.getString("Email");
                    pass = rs.getString("Pass");
                    gender = rs.getString("Gender");
                    age = rs.getString("Age");
                    degree = rs.getString("Degree");
                    dept = rs.getString("Department");
                    fees = rs.getString("Fees");
                    contact = rs.getString("Contact");
                    address = rs.getString("Address");
                    //Reg_Date=rs.getString("Reg_Date");
%>

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
                                    <center><h3>Doctor Update Form</h3></center><hr>		
                                    <form action="EditADoctorProcess.jsp?id=<%=id%>" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor ID</label>
                                                    <input type="text"  disabled="" name="did" id="first_name" class="form-control input-md"   title="Patient ID" value="<%=did%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" required="" name="name" id="last_name" class="form-control input-md" value="<%=name%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" required="" name="email" id="last_name" class="form-control input-md" value="<%=email%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="text" name="pass" required="" id="last_name" class="form-control input-md" value="<%=pass%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Gender</label>
                                                    <select name="gender" required="">
                                                        <option selected="" value="-1" disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="text" required=""  name="age" id="last_name" class="form-control input-md" value="<%=age%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" required="">
                                                        <option selected="" value="-1" disabled="">Select Degree</option>
                                                        <option>M.B.B.S</option>
                                                        <option>B.D.S</option>
                                                        <option>B.P.T</option>
                                                        <option>B.Sc Nursing</option>
                                                        <option>B.H.M.S</option>
                                                        <option>B.A.M.S</option>
                                                        <option>RADIOGRAPHY</option>
                                                        <option>B.O.T</option>
                                                        <option>Optometry</option>
                                                        <option>Lab Technicians</option>
                                                        <option>B.U.M.S</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name="Department" required="">
                                                        <option selected="" value="-1" disabled="">Select Department</option>
                                                        <option>Dentist</option>
                                                        <option>Cardiology</option>
                                                        <option>Gynecologist</option>
                                                        <option>Pathologist</option>
                                                        <option>Radiology</option>
                                                        <option>Neurologist</option>
                                                        <option>Obstetrician</option>
                                                        <option>General Physician</option>
                                                        <option>Ayurveda</option>
                                                        <option>ENT Specialist</option>
                                                        <option>Homeopathy</option>
                                                        <option>veterinary physician</option>
                                                        <option>Demo test</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Fees</label>
                                                    <input type="text" required="" name="fees" id="last_name" class="form-control input-md" value="<%=fees%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" required="" id="first_name" class="form-control input-md" title="Enter Contact No." value="<%=contact%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea required rows="2" cols="20" name="address"><%=address%></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                </div>
 <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
                                <input type="submit" value="Update" class="btn btn-skin btn-block btn-lg">
                                </div>
                            </div></div></div></form>
        </div>
       

    </section>

</body>

</html>
