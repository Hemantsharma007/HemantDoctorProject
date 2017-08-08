<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
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
            String name, email, gender, pass, age, contact, dob, status, pid, room, address, disease;
        %>
        <%
            try {
                String id = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                st = con.createStatement();
                rs = st.executeQuery("select Pid,Pname,Email,Pass,Dob,Contact,Age,Gender,Pstatus,Disease,Address,RoomType from Table_Patient where Pid='" + id + "'");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    name = rs.getString("Pname");
                    email = rs.getString("Email");
                    pass = rs.getString("Pass");
                    contact = rs.getString("Contact");
                    dob = rs.getString("DOB");
                    gender = rs.getString("Gender");
                    age = rs.getString("Age");
                    status = rs.getString("Pstatus");
                    address = rs.getString("Address");
                    disease = rs.getString("Disease");
                    room = rs.getString("RoomType");
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
                                    <center><h3>Patient Registration Form</h3></center><hr>	
                                    <form action="EditPProcess.jsp?id=<%=id%>" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" disabled="" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%=pid%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" name="name" id="last_name" class="form-control input-md" value="<%=name%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="email" id="last_name" class="form-control input-md" value="<%=email%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="text" name="pass" id="last_name" class="form-control input-md" value="<%=pass%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" id="first_name" class="form-control input-md" value="<%=contact%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient DOB</label>
                                                    <input type="date" name="dob" id="last_name" class="form-control input-md" value="<%=dob%>" >
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select name="gender">
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
                                                    <input type="text"  name="age" id="last_name" class="form-control input-md" value="<%=age%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select name="status">
                                                        <option selected="" value="-1" disabled="">Select Marital Status</option>
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
                                                    <input type="text"  name="address" id="last_name" class="form-control input-md" value="<%=address%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Disease</label>
                                                    <input type="text"  name="disease" id="last_name" class="form-control input-md" value="<%=disease%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Room Type</label>
                                                    <select name="room">
                                                        <option selected="" value="-1" disabled="">Select Room Type</option>
                                                        <option>Normal</option>
                                                        <option>Medium</option>
                                                        <option>V.I.P</option>
                                                    </select>
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
                        </div></div> </form>

                </div>	
        </div>			
    </section>

</body>

</html>
