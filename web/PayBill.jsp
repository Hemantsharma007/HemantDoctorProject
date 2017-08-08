<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
        <%!
            Connection con;
            Statement st, st1, st2, st3, st4;
            ResultSet rs;
            String dname, pid, bill, pname, name, disease, id;
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
                            <li><a href="BookApointment.jsp">Book Appointment</a></li>
                            <li><a href="ViewDoctors.jsp">Doctors</a></li>
                            <li><a href="ViewReport.jsp">View Report</a></li>
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
                                    <center><h3>Pay Your Bill Form</h3></center><hr>

                                    <form action="BillProcess.jsp" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <%
                                                        id = (String) session.getAttribute("pid");
                                                        name = (String) session.getAttribute("pname");
                                                       // out.println(id+""+name);
                                                        try {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                            st = con.createStatement();
                                                            rs = st.executeQuery("select Pid from Table_Appointment where Pname='" + name + "'");
                                                            if (!rs.next()) {
                                                                out.println("<center><b>You have Not Fixed any Appointment with any  Doctor Therefore no bill is generated.</b></center>");
                                                            } else {
                                                                rs = st.executeQuery("select Pid from Table_Appointment where Pname='" + name + "'");
                                                                while (rs.next()) {
                                                                    pid = rs.getString("Pid");
                                                                    out.println("<label>Patient ID</label>");
                                                                    out.println("<input type='text' name='pid' disabled  class='form-control input-md' value=" + pid + " required>");
                                                                }
                                                                out.println("<div class='validation'></div></div></div><div class='col-xs-6 col-sm-6 col-md-6'><div class='form-group'>");
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st1 = con.createStatement();
                                                                rs = st1.executeQuery("select Pname from Table_Patient where Pid='" + id + "'");
                                                                while (rs.next()) {
                                                                    pname = rs.getString("Pname");
                                                                    out.println("<label>Patient Name</label>");
                                                                    out.println("<input type='text' name='pname' disabled  class='form-control input-md' value=" + name + " required>");
                                                                }
                                                                out.println("<div class='validation'></div></div></div><div class='col-xs-6 col-sm-6 col-md-6'><div class='form-group'>");
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st2 = con.createStatement();
                                                                rs = st2.executeQuery("select Dname from Table_Appointment where Pid='"+id+"'");
                                                                while (rs.next()) {
                                                                    dname = rs.getString("Dname");
                                                                    out.println("<label>Doctor Name</label>");
                                                                    out.println("<input type='text' name='dname' disabled  class='form-control input-md' value=" + dname + " required>");
                                                                }
                                                                out.println("<div class='validation'></div></div></div><div class='col-xs-6 col-sm-6 col-md-6'><div class='form-group'>");
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st3 = con.createStatement();
                                                                rs = st3.executeQuery("select Disease from Table_Patient where Pid='" + id + "'");
                                                                while (rs.next()) {
                                                                    disease = rs.getString("Disease");

                                                                    out.println("<label>Disease Name</label>");
                                                                    out.println("<input type='text' name='disease' disabled  class='form-control input-md' value=" + disease + " required>");
                                                                }
                                                                out.println("<div class='validation'></div></div></div><div class='col-xs-6 col-sm-6 col-md-6'><div class='form-group'>");
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                                                st4 = con.createStatement();
                                                                rs = st4.executeQuery("select Cost from DiseaseCost where Disease_Name='" + disease + "'");
                                                                while (rs.next()) {
                                                                    bill = rs.getString("Cost");
                                                                    out.println("<label>Bill Amount</label>");
                                                                    out.println("<input type='text' name='amount' disabled  class='form-control input-md' value=" + bill + " required>");
                                                                }
                                                            }
                                                        } catch (Exception e) {
                                                            out.println(e);
                                                        }
                                                    %>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                        <input type="hidden" id="thisField" name="pname"  value="<%=pname%>">
                                        <input type="hidden" id="thisField" name="pid"  value="<%=pid%>">
                                        <input type="hidden" id="thisField" name="dname"  value="<%=dname%>">
                                        <input type="hidden" id="thisField" name="disease"  value="<%=disease%>">
                                        <input type="hidden" id="thisField" name="amount"  value="<%=bill%>">
                                        <input type="submit" value="Pay Bill" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                </div>
                            </div></div></div>
                </div>	
        </div>		
    </section>

</body>

</html>
