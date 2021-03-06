<%-- 
    Document   : myRecord
    Created on : Feb 20, 2017, 8:40:44 PM
    Author     : 696645
--%>

<%@page import="common.VerifySecurityHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

VerifySecurityHelper v=VerifySecurityHelper.getInstance();
try{
    if(!v.isLoggedIn(request, response)) response.sendRedirect("MainPageServlet");
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.1/angular-sanitize.min.js"></script>
        
        <!--CDN for W3.CSS-->
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        
        <!--Custom-made JS and CSS. Important: MUST CHANGE ALL PATHS HERE WHEN FILE IS MOVED-->
        <script src="_js/main/main-page-script.js" type="text/javascript"></script>
        <script src="_js/_common/common.js" type="text/javascript"></script>
<!--        <script src="_js/patient/my-patient.js" type="text/javascript"></script>-->
        <script src="_js/angular/validation.js" type="text/javascript"></script>
        <script src="_js/angular/journal-controller.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="_css/common/common.css">
        <link rel="stylesheet" type="text/css" media="screen" href="_css/main/main-page-style.css">
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="journalApp">
            
            <!--Logo-->
            <header>
                
                <!--Logo. IMPORTANT: MUST CHANGE the PATHs HERE WHEN FILE IS MOVED-->
                <div id="slides" class="slideshow">
                    <div>
                        <!--<img id="logo" class="logos" src="_res/common/logo5.png" alt="Health To Go Nutrition Care">-->
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
                            <li class="active"><a href="patient.jsp"><span class="icon-home" style="font-size: 1.2em;" ></span>&nbsp;Home</a></li>
                            <li class="#"><a href="patient.jsp#services-page"> Services</a></li>
                            <li class="#"><a href="patient.jsp#about-page"> About Us</a></li>
                            <li class="#"><a style="cursor:pointer" id="contact-popup">Contact</a></li>
                            <li class="#"><a href="NutritionLibrary">Nutrition Library</a></li>

                            <!--patient-->
                            <li class='${patientStatus} dropdown'>
                                    <a class='dropdown-toggle' data-toggle='dropdown' href='#'>Account<span class='caret'></span></a>
                                    <ul class='dropdown-menu'>
                                        <li><a href='#'>(5) <span class="assigned">(Mamadou)</span> Reset Login</a></li>
                                        <li><a href='PatientInformation'>Edit Account Infomation</a></li>
                                        <li><a href='paymentPlan.jsp'>Payment plan</a></li>
                                        <li><a href='#'>(10) <span class="assigned">(Last)</span> Pay for service</a></li>
                                        <li><a href='Record'>My Record</a></li>
                                        <li><a href='messageToNutritionist.jsp'>Send message to nutritionist</a></li>
                                        <li><a href='myJournal.jsp'>My Journal</a></li>
                                        <li><a href='#'>(19) <span class="assigned">(Rodney)</span> Search FAQ, tips and nutrition library</a></li>
                                        <li><a href='#'>(22) Subscribe to advert(s)</a></li>
                                        <li><a href='#'>(26) Manage invoice</a></li>
                                        <li><a href='#'>(27) Book appointment</a></li>
                                    </ul>
                            </li>
                            
                            <!--nutritionist-->
<!--                            <li class="${nutritionistStatus} dropdown">
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
                            </li>-->
                            
                            <!--administrator-->
<!--                            <li class="${adminStatus} dropdown">
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
                            </li>-->
                            
                            <!--staff-->
<!--                            <li class="${staffStatus} dropdown">
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
                            <li class="${loggedInIconStatus}" style="display: inline-block;">
                                <a><span class='icon-user logged-in user-attrib'> logged in:  
                                        <i> ${userType} </i>
                                </span></a>
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
                <form class="form-horizontal" action="PatientInfo" method="POST">
                    <table class="table table-hover">
                        <thead>
                            <tr><th><label class="control-label col-sm-2" for="txt">Add New Journal</label></th></tr>
                        </thead>
                        <tbody>
                            <tr><td>
                                    <label for="purpose">Purpose</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="purpose" type="text" class="form-control" name="purpose">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="current">Current Weight</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="current" type="text" class="form-control" name="current" placeholder="Enter Current Weight">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="goal">Goal Weight</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="goal" type="text" class="form-control" name="goal" placeholder="Enter Goal Weight">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="start">Start Weight</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="start" type="text" class="form-control" name="start" placeholder="Enter Start Weight">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="lowest">Lowest Weight</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="lowest" type="text" class="form-control" name="lowest" placeholder="Enter Lowest Weight">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="half">Half Way Weight</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="half" type="text" class="form-control" name="halfway" placeholder="Enter Half Way Weight">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="lost">Weight Lost</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="lost" type="text" class="form-control" name="lost" placeholder="Enter Weight Lost">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="calories">Calories Level</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="calories" type="text" class="form-control" name="calories" placeholder="Enter Calories Level">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="chest">Chest Measure</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="chest" type="text" class="form-control" name="chest" placeholder="Enter Chest Measure">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="waist">Waist Measure</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="waist" type="text" class="form-control" name="waist" placeholder="Enter Waist Measuret">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="andomen">Abdomen Measure</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="andomen" type="text" class="form-control" name="abdomen" placeholder="Enter Abdomen Measure">
                                    </div>
                            </td></tr>
                            <tr><td>
                                    <label for="hip">Hip Measure</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
                                        <input id="hip" type="text" class="form-control" name="hip" placeholder="Enter Hip Measure">
                                    </div>

                        </tbody>
                    </table>
                    <input class="btn btn-success" type="submit" name="submitNewJournal" value="Add">
                    <a href="myJournal.jsp" class="btn btn-warning" role="button">Cancel</a>
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
            <!--contact modal popup-->
             <div class="modal fade" id="modal-contact-popup" role="dialog">
                 <div class="modal-dialog">
                     
                     <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <!--close button-->
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <button type="button" class="close" data-dismiss="modal"><span class="icon-remove"></span></button>
                            
                            <!--contact header-->
                            <h4><span class="icon-envelope"></span> Contact</h4>
                        </div>
                        <!--form USING ANGULAR JS--> 
                        <form action="MainPageServlet" method="post" name="contactForm">
                            
                            <!--modal body-->
                            <div class="modal-body">
                                    <div class="form-group">

                                        <!--enter name-->
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-user"></span>
                                            </span>
                                            <input ng-model="contactName" type="text" class="form-control" name="contactName" placeholder="Enter your name" autofocus required>
                                        </div>

                                        <!--enter email-->
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-envelope"></span>
                                            </span>
                                            <input type="email" class="form-control" name="contactEmail" placeholder="Enter email" required
                                                   ng-model="email">
                                        </div>
                                        <span ng-show="contactForm.contactEmail.$dirty && contactForm.contactEmail.$invalid" 
                                              style="color: red;">
                                            <span ng-messages="contactForm.contactEmail.$error.email" ng-messages-include="_js/angular/messages.html"></span>
                                        </span>

                                        <!--enter subject-->
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-question"></span>
                                            </span>
                                            <input type="text" class="form-control" name="contactSubject" placeholder="Enter subject">
                                        </div>

                                        <!--enter message-->
                                        <div style="padding: 10px 0;">
                                            <label for="message"><span class="icon-pencil"></span>Message:</label>
                                            <textarea ng-model="contactTextArea" class="form-control" name="message" rows="10" placeholder="Enter your message" required></textarea>
                                        </div>
                                        <br>
                                        
                                        <!--submit button-->
                                        <input ng-disabled="contactForm.$invalid" id="contact-btn" class="btn btn-danger pull-left" type="submit" name="submitMessage" value="Send Message">
                                    </div>
                            </div>
                                
                            <!--footer-->
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
             </div>
            
            ${message}        
        </div>
    </body>
</html>