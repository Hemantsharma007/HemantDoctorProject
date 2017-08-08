<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital Management System</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
      var url="doctor.jsp";
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
                                    <center><h3>Doctor Registration Form</h3></center><hr>

                                    <form action="DoctorReg.jsp" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor ID</label>
                                                    <input type="text" name="did" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                        Random random = new Random();
                                                            Set<Integer> randomNumbers = new HashSet<Integer>();
                                                            while(randomNumbers.size() <1)
                                                                randomNumbers.add( new Integer(random.nextInt(999) + 100) );
                                                            for(Integer randomNumber : randomNumbers){
                                                                out.println("DID- "+randomNumber);
                                                            }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name"  id="last_name" class="form-control input-md" required="" title="Doctor name can not be blank and should not contain any digit.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email"  placeholder="me@example.com" name="email" id="last_name" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">
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
                                                    <label>Doctor Gender</label>
                                                    <select name="gender" class="form-control">
                                                         <option selected="" disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                   </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                             <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Age</label>
                                                    <input type="number"  name="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>        
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" class="form-control">
                                                         <option selected="" disabled="">Select Degree</option>
                                                        <option>M.B.B.S</option>
                                                        <option>B.D.S</option>
                                                        <option>B.P.T</option>
                                                        <option>B.Sc Nursing</option>
                                                        <option>B.H.M.S</option>
                                                        <option>B.A.M.S</option>
                                                        <option>RADIOGRAPHY</option>
                                                        <option>D.D.S</option>
                                                        <option>M.D</option>
                                                   </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
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
                                                    <label>Department ID</label>
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
                                                    <label>Doctor Fees</label>
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
                                                    <label>Contact No.</label>
                                                    <input type="number" required="" name="phone" id="first_name" class="form-control input-md" title="Enter Contact No.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea  title="Enter your Address" required rows="2" cols="20" name="address"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h3>Doctor Photo:</h3>
                                                        </div>
                                                        
                                                        <div class=" col-md-6">
                                                            
                                                            <input  type="file" name="file123" >
                                                        </div>
                                                    </div>
                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center>
                                        <a href="ForgotPassword.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DoctorLogin.jsp">Login Here</a>
                                    </center><hr>
                                </div>

                            </div></div></div>

                </div>	
        </div>		

    </section>

</body>

</html>
