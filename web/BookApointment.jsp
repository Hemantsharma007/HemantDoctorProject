<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital Management System</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap.min.js"></script>
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <script language="javascript" type="text/javascript">  
      var xmlHttp;  
      function showDoctor(str){
      if (typeof XMLHttpRequest !== "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      } 
      var url="doctors.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
      document.getElementById("doctor").innerHTML=xmlHttp.responseText; 
      }   
      }

      function showFees(str){
      if (typeof XMLHttpRequest !== "undefined"){
        xmlHttp= new XMLHttpRequest();
        }
      else if (window.ActiveXObject){
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      } 
      var url="fees.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function stateChange1(){   
      if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
      document.getElementById("fees").innerHTML=xmlHttp.responseText;   
      }   
      }
      </script>  
    </head>

    <body id="page-top"  style="background:url('images/bg1.jpg') repeat left top;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
            Connection con;
            Statement st;
            ResultSet rs;
            String dname, fees,dept;
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
                            <li><a href="ViewDoctors.jsp">Doctors</a></li>
                            <li><a href="FeedbackForm.jsp">Feedback</a></li>
                            <li><a href="PayBill.jsp">Pay Bill</a></li>
                            <li><a href="About.jsp">About</a></li>
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
                                    <center><%
                                        String id = (String) session.getAttribute("pid");
                                        String name = (String) session.getAttribute("pname");
                                        out.println("Welcome" + "&nbsp;&nbsp;&nbsp;");
                                        out.println("<b>" + name + "</b>");
                                        out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;" + "[" + id + "]</b>");
                                        %></center><hr>
                                    <center><h3>Book Appointment</h3></center><hr>
                                    <form action="AppointmentReg.jsp" method="post" name="form" class="contactForm lead">
                                        <div class="row">

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name='department' onchange="showDoctor(this.value)" required="" class="form-control">
                            <option selected="" value="none" disabled="">Select Department</option>
                                                      <%
                                try
                                {
                                    String query="select * from dept";
                                    Class.forName("com.mysql.jdbc.Driver");
                                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement", "root", "");
                                    Statement st = con.createStatement();
                                    ResultSet   rs = st.executeQuery(query);
                                    while (rs.next()) 
                                    {
                                        %>
                                        <option value="<%=rs.getInt("deptid")%>" 
                                                <%
                                                    if(request.getParameter("Department")!=null)
                                                    {
                                                           if(rs.getInt("deptid")==Integer.parseInt(request.getParameter("Department")))  
                                                           {
                                                               out.println("Selected");
                                                           }
                                                    }
                                                %>
                                                ><%=rs.getString("deptName")%></option>
                                        <%
                                    }
                                     
                                }
                                catch(Exception e)
                                {
                                    
                                }
                            %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Doctor</label>
                                                    <div id="doctor">
                                                        <select name='doctor' class="form-control">  
                                                                <option value='-1'>Select Doctor</option>  
                                                                </select>
                                                    </div>                                         
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Consultancy Fees</label>
                                                    <div id="fees">
                                                        <select name='fees' class="form-control">  
                                                                <option value='-1'>Doctor Fees</option>  
                                                                </select>
                                                    </div>  
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Date</label>
                                                    <input type="date" required="" name="date" id="mydate" class="form-control input-md" title="Appointment Date">
                                                    
                                                    <script>
                                                        
                                                        var today = new Date();
                                                        var dd = today.getDate();
                                                        var mm = today.getMonth()+1; //January is 0!
                                                        var yyyy = today.getFullYear();
                                                         if(dd<10){
                                                                dd='0'+dd
                                                            } 
                                                            if(mm<10){
                                                                mm='0'+mm
                                                            } 

                                                        today = yyyy+'-'+mm+'-'+dd;
                                                        document.getElementById("mydate").setAttribute("min", today);
                                                        
                                                    </script>
                                                    
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Time</label>
                                                    <input type="time" required="" name="time" id="first_name" class="form-control input-md" title="Appointment Time">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                       <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                      
                                    </form>
                                    <center>
                                        <a style="color:red;" href="LastAppointment.jsp?id=<%=id%>">View your Last Appointment</a>
                                    </center>
                                </div>


                            </div></div></div>

                </div>	
        </div>				
    </section>
    
</body>

</html>
