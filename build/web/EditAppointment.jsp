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
            //Date date = new Date();
            //SimpleDateFormat sdf = new SimpleDateFormat();
            //String s = sdf.format(date);
            Connection con;
            Statement st;
            ResultSet rs;
            String pid,pname,dname, adate,time,dept,fees;
            String id;
        %>
        <%
            try 
            {
                 id = request.getParameter("id");
                 //String name=(String)session.getAttribute("name");
                out.println(id);
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                st = con.createStatement();
                rs = st.executeQuery("select Pid,Pname,Department,Dname,Fees,App_Date,App_Time from Table_Appointment where Pid='"+id+"'");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    pname = rs.getString("Pname");
                    dept = rs.getString("Department");
                    dname = rs.getString("Dname");
                    fees = rs.getString("Fees");
                    adate = rs.getString("App_Date");
                    time = rs.getString("App_Time");
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
                            <li><a href="Services.jsp">Services</a></li>
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

                            <div class="panel-body">
                                    <center><h3>Edit Appointment</h3></center><hr>
                                    <form action="UpdateAppointment.jsp?id=<%=id%>" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" required="" disabled="" name="pid"  class="form-control input-md"  value="<%=pid%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                                     <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" required="" name="name"  class="form-control input-md"  value="<%=pname%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name="Department" class="form-control" required="">
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
                                                    <label>Select Doctor</label>
                                                    <select name="doc" required="" class="form-control">
                                                        <option selected="" value="-1" disabled="">Doctor Name</option>
                                                        <%
                                                             //String id1=(String)session.getAttribute("pid");
                                                            try {
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st = con.createStatement();
                                                                rs = st.executeQuery("select Dname from Table_Doctor");
                                                                while (rs.next()) {
                                                                    dname = rs.getString("Dname");
                                                        %>         
                                                        <option><%=dname%></option>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }

                                                        %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Consultancy Fees</label>
                                                    <select name="fees" class="form-control">
                                                        <option selected="" value="-1" disabled="">Consultancy Fees</option>
                                                        <%                                                                                                            try {
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st = con.createStatement();
                                                                rs = st.executeQuery("select Fees from Table_Doctor where Dname='" + dname + "'");
                                                                while (rs.next()) {
                                                                    fees = rs.getString("Fees");
                                                        %>         
                                                        <option><%=fees%></option>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }

                                                        %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Date</label>
                                                    <input type="date" required="" name="date" id="first_name" class="form-control input-md" title="Appointment Date" value="<%=adate%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Time</label>
                                                    <input type="time" required="" name="time" id="first_name" class="form-control input-md" title="Appointment Time" value="<%=time%>">
                                                    <div class="validation"></div>
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
                                
                                </form><center><a href="CancelAppointment.jsp?id=<%=id%>">Cancel Appointment</a></center>
                            </div>
                                    
                            </div>
                                
                            </div>
                        </div></div> 

                </div>			
    </section>

</body>
        </html>