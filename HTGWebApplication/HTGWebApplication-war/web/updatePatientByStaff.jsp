<%-- 
    Document   : updatePatientByStaff
    Created on : Mar 1, 2017, 10:55:48 AM
    Author     : 690727
    Description: JSP to be used for updating the patient information by bringing in the 
    form prefilled with the patient information to be updated
--%>


<%@page import="common.VerifySecurityHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

VerifySecurityHelper v=VerifySecurityHelper.getInstance();
try{
    if(!v.isLoggedIn(request, response)){
       response.sendRedirect("MainPageServlet");}   
}catch(Exception ex){
    System.out.println("error: "+ex.getMessage());
}
%>
<!DOCTYPE html>
<html>
 <head>
        <title>Health To Go Nutrition Care</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--This meta statement tells individual devices not to scale the web page but rather to use the scale of 1. 
        Meaning, if we are on a device that's 700px across, it will render the page as if there were on 700px, 
        allowing the rest of the HTML to move around. The device will not attempt to show the entire page and scale it 
        down-->
        <meta name="Viewport" content="width=device-width, initial-scale=1"> 
        
        <!--CDN for JQuery date picker-->
        <!--IMPORTANT: MUST CHANGE PATH HERE FOR CUPERTINO WHEN FILE IS MOVED. Cupertino is needed by datepicker-->
        <link href="_css/common/cupertino/jquery-ui.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        
        <!--CDN for JQuery date picker. Needs to be at this spot-->
        <script src="_js/_common/temp/jquery-1.11.3.min.js"></script>
        
        <!--CDN for general JQuery and Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <!--CDN for JQuery date picker. Needs to be at this spot-->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <!--CDN for Angular JS-->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="https://code.angularjs.org/1.3.0-rc.2/angular.js"></script>
        <script src="https://code.angularjs.org/1.3.0-rc.2/angular-messages.js"></script>
        
        <!--CDN for W3.CSS-->
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        
        <!--Custom-made JS and CSS. Important: MUST CHANGE ALL PATHS HERE WHEN FILE IS MOVED-->
        <script src="_js/main/main-page-script.js" type="text/javascript"></script>
        <script src="_js/_common/common.js" type="text/javascript"></script>
        <script src="_js/_common/angular/validation.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="_css/common/common.css">
        <link rel="stylesheet" type="text/css" media="screen" href="_css/main/main-page-style.css">
  </head>
   
        
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
            
            <!--Logo-->
            <header>
                
                <!--Logo. IMPORTANT: MUST CHANGE the PATHs HERE WHEN FILE IS MOVED-->
                <div id="slides" class="slideshow">
                    <div>
                        <img id="logo" class="logos" src="_res/common/logo5.png" alt="Health To Go Nutrition Care">
                    </div>
                    <div>
                        <img id="logo2" class="logos" src="_res/common/logo6.png" alt="Health To Go Nutrition Care">
                    </div>
                </div>  
            </header>
            
            
            <!--Navigation bar-->
            <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="150">
                <div class="container-fluid" id="nav_local">
                    
                    <!--Navigation bar for small screens-->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>          
                        </button>
                        <a class="navbar-brand" href="#"></a>
                    </div>
                    
                    <!--Regular navigation bar-->
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            
                            <!--IMPORTANT: MUST CHANGE ALL PATHS HERE WHEN FILE IS MOVED-->
			    <li class="#"><a href="MainPageServlet?page=index#main-page"><span class="icon-home" style="font-size: 1.2em;" ></span>&nbsp;Home</a></li>
			    <li class="#"><a href="MainPageServlet?page=index#services-page"> Services</a></li>
			    <li class="#"><a href="MainPageServlet?page=index#about-page"> About Us</a></li>
                            <li class="#"><a style="cursor:pointer" id="contact-popup">Contact</a></li>
                            <li class="#"><a href="NutritionLibrary">Nutrition Library</a></li>
                            
<!--                            No one logged in
                            <li class="${noneLoggedIn} dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    
                                    Account
                                    
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    
                                    check MainPageServlet.java and HtmlPageHelper.java for the contents of classRequireLogin
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(5) <span class="assigned">(Mamadou)</span> Reset Login</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(6) <span class="assigned">(Linh)</span> Create / Update account</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(8) <span class="assigned">(Marufa)</span> Payment plan</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(10) <span class="assigned">(Last)</span> Pay for service</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(12) <span class="assigned">(Marufa)</span> Send message to nutritionist</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(13) <span class="assigned">(Marufa/Rachel)</span> Patient journal</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(19) <span class="assigned">(Rodney)</span> Search FAQ, tips and nutrition library</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(22) <span class="assigned">(Marufa)</span> Subscribe to advert(s)</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(26) <span class="assigned">(Marufa)</span> Manage invoice</a></li>
                                    <li><a style="cursor:pointer" ${classRequireLogin}>(27) <span class="assigned">(Marufa)</span> Book appointment</a></li>
                                </ul>
                            </li>-->
                            
                            
                            <!--patient-->
                            <li class='${patientStatus} dropdown'>
                                    <a class='dropdown-toggle' data-toggle='dropdown' href='#'>Account<span class='caret'></span></a>
                                    <ul class='dropdown-menu'>
                                        <li><a href='#'>(5) <span class="assigned">(Mamadou)</span> Reset Login</a></li>
                                        <li><a href='editAccount.jsp'>Edit Account Infomation</a></li>
                                        <li><a href='#'>(8) Payment plan</a></li>
                                        <li><a href='#'>(10) <span class="assigned">(Last)</span> Pay for service</a></li>
                                        <li><a href='#'>(12) Send message to nutritionist</a></li>
                                        <li><a href='#'>(13) <span class="assigned">(Marufa/Rachel)</span> Patient journal</a></li>
                                        <li><a href='#'>(19) <span class="assigned">(Rodney)</span> Search FAQ, tips and nutrition library</a></li>
                                        <li><a href='#'>(22) Subscribe to advert(s)</a></li>
                                        <li><a href='#'>(26) Manage invoice</a></li>
                                        <li><a href='#'>(27) Book appointment</a></li>
                                    </ul>
                            </li>
                            
<!--                            nutritionist
                            <li class="${nutritionistStatus} dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    
                                        Nutritionist
        
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">(3) <span class="assigned">(Mamadou)</span> Manage staff</a></li>
                                    <li><a href="#">(5) <span class="assigned">(Mamadou)</span> Reset login</a></li>
                                    <li><a href="#">(7) <span class="assigned">(Mamadou)</span> Manage patient account</a></li>
                                    <li><a href="#">(11) Answer messages from patient</a></li>
                                    <li><a href="#">(13) <span class="assigned">(Marufa/Rachel)</span> Patient journal</a></li>
                                    <li><a href="#">(14) Monitor patient progress</a></li>
                                    <li><a href="#">(15) Manage patients' journals</a></li>
                                    <li><a href="#">(16) <span class="assigned">(Last)</span> Generate patient progress report</a></li>
                                    <li><a href="#">(17) <span class="assigned">(Last)</span> Generate business report</a></li>
                                    <li><a href="#">(18) <span class="assigned">(Rodney)</span> Manage FAQ, tips and nutrition library</a></li>
                                    <li><a href="#">(19) Search FAQ, tips and nutrition library</a></li>
                                    <li><a href="#">(20) <span class="assigned">(Linh)</span> Manage appointments</a></li>
                                </ul>
                            </li>
                            
                            administrator
                            <li class="${adminStatus} dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                                        Administrator

                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">(3) Manage staff</a></li>
                                    <li><a href="#">(4) Modify security</a></li>
                                    <li><a href="#">(5) Reset login</a></li>
                                    <li><a href="#">(7) Manage patient account</a></li>
                                    <li><a href="#">(15) <span class="assigned">(Marufa/Rachel)</span> Manage patients' journals</a></li>
                                    <li><a href="#">(16) <span class="assigned">(Last)</span> Generate patient progress report</a></li>
                                    <li><a href="#">(19) <span class="assigned">(Rodney)</span> Search FAQ, tips and nutrition library</a></li>
                                    <li><a href="#">(23) Manage activity logs</a></li>
                                    <li><a href="#">(24) <span class="assigned">(Linh)</span> Manage logins</a></li>
                                </ul>
                            </li>
                            
                            staff
                            <li class="${staffStatus} dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                                        Staff
                                    
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">(5) (Mamadou) Reset Login</a></li>
                                    <li><a href="#">(6) <span class="assigned">(Linh)</span> Create and Update patient account</a></li>
                                    <li><a href="#">(7) <span class="assigned">(Mamadou)</span> Manage patient account</a></li>
                                    <li><a href="#">(9) <span class="assigned">(Linh)</span> Manage invoice and payments</a></li>
                                    <li><a href="#">(10) <span class="assigned">(Last)</span> Pay for service</a></li>
                                    <li><a href="#">(15) <span class="assigned">(Marufa/Rachel)</span> Manage patients' journals</a></li>
                                    <li><a href="#">(16) <span class="assigned">(Last)</span> Generate patient progress report</a></li>
                                    <li><a href="#">(17) <span class="assigned">(Last)</span> Generate business report</a></li>
                                    <li><a href="#">(18) Manage FAQ, tips and nutrition library</a></li>
                                    <li><a href="#">(19) Search FAQ, tips and nutrition library</a></li>
                                    <li><a href="#">(20) <span class="assigned">(Linh)</span> Manage appointments</a></li>
                                    <li><a href="#">(21) Manage advertisements</a></li>
                                    <li><a href="#">(25) Manage email notifications</a></li>
                                </ul>   
                            </li>-->
                        </ul>
                        
                        <!--Sign up, login, logout, LoggedIn icons using glyph icons of bootstrap 3-->
                        <ul class="nav navbar-nav navbar-right">
                            <li class="${logoutIconStatus}">
                                <a href='UsersServlet?logout=true'> &nbsp; <span class='icon-log-out'></span> Logout</a>
                            </li>
			    
			    <!--logged in link for nutritionist-->
			    <li class="${nutritionistStatus}" style="display: inline-block;">
				    <a href="MainPageServlet?page=nutritionist"><span class='icon-user logged-in user-attrib'> logged in: </span> 
					    <span id="userSpan"><i> Nutritionist </i></span>
				    </a>
			    </li> 
			    
			    <!--logged in link for admin-->
			    <li class="${adminStatus}" style="display: inline-block;">
				    <a href="MainPageServlet?page=admin"><span class='icon-user logged-in user-attrib'> logged in: </span> 
					    <span id="userSpan"><i> Admin </i></span>
				    </a>
			    </li> 
			    
			    <!--logged in link for staff-->
			    <li class="${staffStatus}" style="display: inline-block;">
				    <a href="MainPageServlet?page=staff"><span class='icon-user logged-in user-attrib'> logged in: </span> 
					    <span id="userSpan"><i> Staff </i></span>
				    </a>
			    </li> 
			    
                            <li class="${signUpIconStatus}">
                                <a style='cursor:pointer' class='sign-up'><span class='icon-user'></span> Sign Up</a>
                            </li>
                            <li class="${logInIconStatus}">
                                <a style='cursor:pointer' id='my-login'><span class='icon-log-in'></span> Login</a>
                            </li>
                        </ul>
                                
                    </div>
                </div>
            </nav>
                                
            <div class="container">
                    <form class="form-horizontal" action="ManagePatientByStaffServlet" method="POST" name="registrationForm">
                        <input type="hidden" name="patientId" value="${patientId}">
                        <table class="table table-hover">
                            <thead>
                                <tr><th><label class="control-label col-sm-2" for="txt">Personal details</label></th></tr>
                            </thead>
                            <tbody>
                                <tr><td>
                                        <label for="fname">First Name:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                            <input id="firstName" type="text" class="form-control" name="firstName" value="${firstName}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="lname">Last Name: </label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                            <input id="lastName" type="text" class="form-control" name="lastName" value="${lastName}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="birth">Date of Birth:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-gift"></span></span>
                                            <input type="text" id="datepicker" class="form-control" name="dateOfBirth" value="${dateOfBirth}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="add">Address:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                            <input id="address" type="text" class="form-control" name="address" value="${address}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="phone">Home Phone:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                            <input id="homephone" type="text" class="form-control" name="homePhone" value="${homePhone}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="phone">Cell Phone:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                            <input id="cellphone" type="text" class="form-control" name="cellPhone" value="${cellPhone}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="email">Email:</label> 
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                            <input type="email" class="form-control" name="email" required value="${email}">
                                        </div>
                                        
                                </td></tr>  
                                   <tr><td>
                                        <label for="contract">Contract Period:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            <input type="text" class="form-control" name="contract" value="${contract}">
                                        </div>
                                </td></tr>
                                <tr><td>
                                        <label for="gender">Gender:</label> 
                                        <div class="input-group">
                                            <%
                                                String gender;
                                                if((request.getAttribute("gender"))== null)
                                                   gender = "";
                                                else
                                                    gender = (String)request.getAttribute("gender");
                                                if(gender.equals("M"))
                                                {
                                                    out.print("<input type='radio' name='gender' value='M' checked> Male&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                                                    out.print("<input type='radio' name='gender' value='F' > Female");
                                                }
                                                else if(gender.equals("F"))
                                                {
                                                    out.print("<input type='radio' name='gender' value='M' > Male&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                                                    out.print("<input type='radio' name='gender' value='F' checked> Female");
                                                }
                                                else
                                                {
                                                    out.print("<input type='radio' name='gender' value='M' > Male&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                                                    out.print("<input type='radio' name='gender' value='F' > Female");
                                                }
                                                %>
                                        </div>
                                </td></tr>
                            </tbody>
                        </table>
<!--                     <table class="table table-hover">
                     <thead>
                 <tr><th>
                 <div class="form-group">
                 <label class="control-label" for="txt">Security Questions and Banking Info:</label>
                 </div>
                  </th></tr>
                 </thead><tbody>
                <tr><td>
                  <div class="btn-group-vertical">
                   <a id="white" href="SecurityServlet" class="btn btn-warning btn-lg" role="button" >Edit Security Question</a><br/>
                   <a id="white" href="#" class="btn btn-warning btn-lg" role="button">Edit Bank information</a><br/>
                   </div>    
                 </td></tr>
                 </tbody>
                </table>          -->
             <table class="table table-hover">
            <tbody>
           <tr><td>
           <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
             <input type="submit" name="submitCancelPatientUpdate" value="Cancel" class="w3-btn w3-gray" style="width:150px;">
            </div>
            </div>
           </td><td>
            <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
             <input class="btn btn-success" type="submit" name="submitEditPatient" value="Save" style="width:150px;">
             </div>
            </div>
            </td></tr>
            </tbody>
           </table>
            </form> 
              <br/>
             </div>
            
            
            <!--footer section-->
            <footer class="navbar navbar-inverse container-fluid">
                 <div align='center'>
                     <p>Copyright &copy; Health To Go, Inc. 
                         <strong>|</strong> 
                            Tel: 403.998.9902 
                         <strong>|</strong> 
                         <a target="_blank" href="https://www.google.ca/maps/dir//140+Castlebrook+Rise+NE,+AB+T3J+1P1,+CANADA/@51.1050826,-113.9695245,16z/data=!3m1!4b1" style="text-decoration: none; color: black; ">
                                <span class="icon-map-marker office-address"
                                      data-toggle="tooltip"
                                      data-placement="top"
                                      title="Click me!"
                                      data-content="Direction to get to office">
                                </span>
                            </a> 
                        <strong>|</strong> 
                            <a href="mailto:amina.ashraf@yahoo.com">
                                amina.ashraf@yahoo.com
                            </a> 
                        <strong>|</strong> 
                            <a href="designer.jsp">
                                Designed by: M.R.M.T.R.
                            </a>
                     </p>
                </div>
            </footer> 
            
            
            
            
            <!-- +++++++++++++++++++++++++++popups+++++++++++++++++++++++++++ -->
            
            <!--contact modal popup-->
<!--             <div class="modal fade" id="modal-contact-popup" role="dialog">
                 <div class="modal-dialog">
                     
                      Modal content
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            close button
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <button type="button" class="close" data-dismiss="modal"><span class="icon-remove"></span></button>
                            
                            contact header
                            <h4><span class="icon-envelope"></span> Contact</h4>
                        </div>
                        form USING ANGULAR JS 
                        <form action="MainPageServlet" method="post" name="contactForm">
                            
                            modal body
                            <div class="modal-body">
                                    <div class="form-group">

                                        enter name
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-user"></span>
                                            </span>
                                            <input ng-model="contactName" type="text" class="form-control" name="contactName" placeholder="Enter your name" autofocus required>
                                        </div>

                                        enter email
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-envelope"></span>
                                            </span>
                                            <input type="email" class="form-control" name="contactEmail" placeholder="Enter email" required
                                                   ng-model="email">
                                        </div>
                                        <span ng-show="contactForm.contactEmail.$dirty && contactForm.contactEmail.$invalid" 
                                              style="color: red;">
                                            <span ng-messages="contactForm.contactEmail.$error.email" ng-messages-include="_js/_common/angular/messages.html"></span>
                                        </span>

                                        enter subject
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-question"></span>
                                            </span>
                                            <input type="text" class="form-control" name="contactSubject" placeholder="Enter subject">
                                        </div>

                                        enter message
                                        <div style="padding: 10px 0;">
                                            <label for="message"><span class="icon-pencil"></span>Message:</label>
                                            <textarea ng-model="contactTextArea" class="form-control" name="message" rows="10" placeholder="Enter your message" required></textarea>
                                        </div>
                                        <br>
                                        
                                        submit button
                                        <input ng-disabled="contactForm.$invalid" id="contact-btn" class="btn btn-danger pull-left" type="submit" name="submitMessage" value="Send Message">
                                    </div>
                            </div>
                                
                            footer
                            <div class="modal-footer">
                                <h5 id="address-link">
                                    <a target="_blank" 
                                       href="https://www.google.ca/maps/dir//140+Castlebrook+Rise+NE,+AB+T3J+1P1,+CANADA/@51.1050826,-113.9695245,16z/data=!3m1!4b1">
                                            <span class="icon-map-marker"> 
                                                140 Castlebrook Rise NE, AB T3J 1P1, CANADA
                                            </span>
                                    </a>
                                </h5>
                            </div>
                        </form>
                    </div>
                 </div>
             </div>-->
            
            
            <!--Messages coming from Servlet-->
            ${message}
            
        </div>
        
    </body>
</html>
