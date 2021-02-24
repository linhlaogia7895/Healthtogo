<%-- 
    Document   : Adverts.jsp
    Version    : Jan 26, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: jsp to for all adverts
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Promotions</title>
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
                            <li class="active"><a href="#main-page"><span class="icon-home" style="font-size: 1.2em;" ></span>&nbsp;Home</a></li>
                            <li class="#"><a href="#services-page"> Services</a></li>
                            <li class="#"><a href="#about-page"> About Us</a></li>
                            <li class="#"><a style="cursor:pointer" id="contact-popup">Contact</a></li>
                            <li class="#"><a href="NutritionLibrary">Nutrition Library</a></li>
                            
                            <!--No one logged in-->
                            <li class="${noneLoggedIn} dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    
                                    Account
                                    
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    
                                    <!--check MainPageServlet.java and HtmlPageHelper.java for the contents of classRequireLogin-->
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
                            </li>
                            
                            
                            <!--patient-->
                            <li class='${patientStatus} dropdown'>
                                    <a class='dropdown-toggle' data-toggle='dropdown' href='#'>Account<span class='caret'></span></a>
                                    <ul class='dropdown-menu'>
                                        <li><a href='#'>(5) <span class="assigned">(Mamadou)</span> Reset Login</a></li>
                                        <li><a href='PatientInformation'>Edit Account Infomation</a></li>
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
                            
                            <!--nutritionist-->
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
                            
                            <!--administrator-->
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
                            
                            <!--staff-->
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
                            </li>
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
            
            
            <!--ENTER YOUR HTML HERE-->

            <!--advert page -->
            <section id="main-page" class="main-page">
                
                    <!--main image on home page-->
                    <div class="w3-row w3-container container-fluid">
                        <div class="w3-col s3 w3-left">
                            asdasdf
                        </div>
                        <div class="w3-col s9 w3-dark-grey w3-center">
                            <img id="main-img" class="w3-hover-opacity img-thumbnail main-img" alt="Nutritionist with fruits" src="_res/main/images/section1.jpg">        
                        </div>
                    </div>
                    
                    
            </section>
            
            
            
            <!--footer section-->
            <footer class="navbar navbar-inverse container-fluid">
                 <div align='center'>
                     <p>Copyright &copy; Health To Go, Inc. 
                         <strong>|</strong> 
                            Tel: 403.998.9902 
                         <strong>|</strong> 
                         <a target="_blank" href="https://www.google.ca/maps/dir//140+Castlebrook+Rise+NE,+AB+T3J+1P1,+CANADA/@51.1050826,-113.9695245,16z/data=!3m1!4b1" style="text-decoration: none; color: black; ">
                                <span class="icon-home office-address"
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
            
            
            
            <!-- +++++++++++++++++++++++popups+++++++++++++++++++++++ -->
            
            <!--login modal popup-->
            <div class="modal fade container-fluid" id="modal-login-popup" role="dialog">
                <div class="modal-dialog">

                  <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <!--close button-->
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <button type="button" class="close" data-dismiss="modal"><span class="icon-remove"></span></button>
                            
                            <!--login symbol-->
                            <h4><span class="icon-lock"></span> Login</h4>
                        </div>
                        
                        <div class="modal-body">
                            
                            <!--form-->
                            <form role="form" action="UsersServlet" method="post" name="loginForm">
                                <div class="form-group">
                                    
                                    <!--enter username-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="myUser" class="form-control" type="text" name="userName" placeholder="Enter username" autofocus required>
                                    </div>
                                    
                                    <!--enter password-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-lock"></span>
                                        </span>
                                        <input ng-model="myPass" class="form-control" type="password" name="password" placeholder="Enter password" required>
                                    </div> 
                                </div>
                                
                                <!--remember me checkbox-->
                                <div class="checkbox">
                                    <label><input type="checkbox" name="remember-me-login" checked>Remember me</label>
                                </div>
                                
                                <!--login submit button-->
                                    <input type="submit" class="btn btn-success btn-block" name="submitLogin" value="Login">
                            </form>
                            
                        </div>
                        
                        <!--login footer section-->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="icon-remove"></span> Cancel</button>
                            <p>Not a member? <a style="cursor:pointer" class="sign-up">Sign Up</a></p>
                            <p>Forgot <span data-dismiss="modal"><a style="cursor:pointer" id="forgot-password">Password?</a></span></p>
                        </div>
                    </div>
                </div>
            </div> 
            
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
                                            <span ng-messages="contactForm.contactEmail.$error.email" ng-messages-include="_js/_common/angular/messages.html"></span>
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
                                            <span class="icon-home"> 
                                                140 Castlebrook Rise NE, AB T3J 1P1, CANADA
                                            </span>
                                    </a>
                                </h5>
                            </div>
                        </form>
                    </div>
                 </div>
             </div>
            
            <!--modal sign up popup-->
            <div class="container modal fade" 
                 id="modal-sign-up-popup" 
                 role="dialog" >
                
                <div class="modal-dialog">
                    
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <!--close button-->
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <button type="button" id="close-sign-up-btn" class="close" data-dismiss="modal"><span class="icon-remove"></span></button>
                            
                            <!--sign up header-->
                            <h4><span class="icon-plus"></span> Sign Up</h4>
                            
                        </div>
                        
                        <!--modal body-->
                        <div class="modal-body">
                            
                            <!--form-->
                            <form action="UsersServlet" method="post" 
                                  name="registrationForm"  novalidate >
                                
                                <div class="form-group">
                                    
                                    <!--enter first name-->
<!--                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="userFName" type="text" 
                                               class="form-control" name="firstName" 
                                               placeholder="Enter fist name" autofocus required>
                                    </div>
                                    <span ng-show="registrationForm.firstName.$dirty && registrationForm.firstName.$invalid" style="color: red;">
                                        <div ng-messages="registrationForm.firstName.$error" ng-messages-include="_js/_common/angular/messages.html"></div>
                                    </span>
                                    
                                    enter last name
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="userLName" type="text" 
                                               class="form-control" name="lastName" 
                                               placeholder="Enter last name" required>
                                    </div>
                                    <span ng-show="registrationForm.lastName.$dirty && registrationForm.lastName.$invalid" style="color: red;">
                                        <div ng-messages="registrationForm.lastName.$error" ng-messages-include="_js/_common/angular/messages.html"></div>
                                    </span>-->
                                    
                                    <!--username-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="username" type="text" 
                                               class="form-control" name="username" 
                                               placeholder="Enter username" required>
                                    </div>
                                    <span ng-show="registrationForm.username.$dirty && registrationForm.username.$invalid" style="color: red;">
                                        <div ng-messages="registrationForm.username.$error" ng-messages-include="_js/_common/angular/messages.html"></div>
                                    </span>
                                    
                                    
                                    <!--password-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="password" 
                                               check-password="password"
                                               type="password" 
                                               class="form-control" 
                                               name="password" 
                                               placeholder="Enter password" 
                                               data-toggle="popover" 
                                               data-trigger="focus" 
                                               data-placement="right" 
                                               title="Requirement" 
                                               data-content="A min of 8 characters, at least one uppercase, at least one lowercase, at least 2 numbers, and at least one special character" 
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.password.$dirty && registrationForm.password.$invalid" style="color: red;">
                                        <div ng-messages="registrationForm.password.$error" ng-messages-include="_js/_common/angular/messages.html"></div>
                                    </span>
                                    
                                    <!--confirm password-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="confirmPassword"
                                               compare-to="password" 
                                               type="password" 
                                               class="form-control" 
                                               name="confirmPassword" 
                                               placeholder="Confirm password" 
                                               data-toggle="popover" 
                                               data-trigger="focus" 
                                               data-placement="right" 
                                               title="Requirement" 
                                               data-content="Must match the password" 
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.confirmPassword.$dirty && registrationForm.confirmPassword.$invalid" style="color: red;">
                                        <span ng-messages="registrationForm.confirmPassword.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>
                                    
                                    <!--enter email-->
<!--                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-envelope"></span>
                                        </span>
                                        <input type="email" class="form-control" 
                                               name="email" placeholder="Enter email" 
                                               ng-model="email" 
                                               data-toggle="popover"
                                               data-trigger="focus"
                                               data-placement="left"
                                               title="Example"
                                               data-content="someone@example.com"
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.email.$dirty && registrationForm.email.$invalid" style="color: red;">
                                        <span ng-messages="registrationForm.email.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>
                                    
                                    enter address
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-home"></span>
                                        </span>
                                        <input ng-model="address" 
                                               type="text" 
                                               class="form-control" 
                                               name="address" 
                                               placeholder="Enter full Address" 
                                               data-toggle="popover" 
                                               data-trigger="focus" 
                                               data-placement="left" 
                                               title="Example" 
                                               data-content="140 Castlebrook Rise NE, AB T3J 1P1, CANADA" 
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.address.$dirty && registrationForm.address.$invalid" style="color: red;">
                                        <span ng-messages="registrationForm.address.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>
                                    
                                    enter home phone
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-phone-alt"></span>
                                        </span>
                                        <input ng-model="homePhone" 
                                               type="tel" 
                                               class="form-control container-fluid" 
                                               name="homePhone" 
                                               placeholder="Home phone number" 
                                               pattern="\d{10}" 
                                               data-toggle="popover" 
                                               data-trigger="focus" 
                                               data-placement="left" 
                                               title="Format" 
                                               data-content="10 digits, No dashes or spaces: 7778889999" 
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.homePhone.$dirty && registrationForm.homePhone.$invalid" style="color: red;">
                                        <span ng-messages="registrationForm.homePhone.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>
                                    
                                    enter cell phone
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-phone-alt"></span>
                                        </span>
                                        <input ng-model="cellPhone" 
                                               type="tel" 
                                               class="form-control container-fluid" 
                                               name="cellPhone" 
                                               placeholder="Home cell number" 
                                               pattern="\d{10}" 
                                               data-toggle="popover" 
                                               data-trigger="focus" 
                                               data-placement="left" 
                                               title="Format" 
                                               data-content="10 digits, No dashes or spaces: 7778889999" 
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.cellPhone.$dirty && registrationForm.cellPhone.$invalid" style="color: red;">
                                        <span ng-messages="registrationForm.cellPhone.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>
                                    
                                    enter date of birth
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-gift"></span>
                                        </span>
                                        
                                        Note: z-index > 1003 impt here. date picker overlaps w/ form-ctrl. w/o z-index, date picker doesn't work
                                        <input ng-model="birthDate" type="text" id="datepicker" class="form-control container-fluid" name="dateOfBirth" placeholder="Enter date of birth" style="z-index: 2010;" required>
                                    </div>
                                    
                                    Gender
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>&nbsp; Gender
                                        </span>
                                        <div class="form-control container-fluid">
                                            <label class="radio inline" style="display: inline;">
                                                <label><input type="radio" class="gender" name="gender-grp" value="male" required checked> Male</label>
                                            </label>
                                            &nbsp;&nbsp;
                                            <label class="radio inline" style="display: inline;" >
                                                <label><input type="radio" class="gender" name="gender-grp" value="female"> Female</label>
                                            </label>
                                        </div>
                                    </div>
                                    
                                    user type
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="icon-user"></span>&nbsp; User Type: 
                                            </span>
                                            <select id="user-type" class="form-control container-fluid" name="userType">
                                                <optgroup label="External">
                                                    <option value="client" selected>Client</option>
                                                </optgroup>
                                                <optgroup label="Internal">
                                                    <option value="nutritionist">Nutritionist</option>
                                                    <option value="admin">Administrator</option>
                                                    <option value="staff">Staff</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                    
                                    contract period
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-gift"></span>
                                        </span>
                                        <input ng-model="contractPeriod" 
                                               type="text" 
                                               class="form-control container-fluid" 
                                               name="contractPeriod" 
                                               placeholder="Enter contract period" 
                                               data-toggle="popover" 
                                               data-trigger="focus" 
                                               data-placement="left" 
                                               title="Example" 
                                               data-content="3 years" 
                                               required>
                                    </div>
                                    <span ng-show="registrationForm.contractPeriod.$dirty && registrationForm.contractPeriod.$invalid" style="color: red;">
                                        <span ng-messages="registrationForm.contractPeriod.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>-->
                                    <br>
                                    
                                    <!--submit sign up button-->
                                    <input ng-disabled="registrationForm.$invalid" id="sign-up-btn" 
                                           class="btn btn-danger btn-lg" 
                                           type="submit" name="submitSignUp" 
                                           value="Submit">
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
            
            <!--modal popup for require login-->
            <div class="modal fade" id="modal-require-login-popup" role="dialog">
                 <div class="modal-dialog modal-sm">
                     
                     <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <!--close top button-->
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                            <!--popup header-->
                            <h4 class="modal-title"><span class="icon-warning"></span> Error!</h4>
                        </div>
                        
                        <!--modal body-->
                        <div class="modal-body">
                            
                            <!--message-->
                            <h5>Sorry. You are required to login to be able to use this feature...</h5>
                        </div>
                    </div>
                 </div>
             </div>
            
            <!--forgot password-->
            <div class="container modal fade" id="modal-forgot-password-popup" role="dialog">
                 <div class="modal-dialog">
                     
                     <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <!--close top button-->
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            
                            <!--popup header-->
                            <h4 class="modal-title"><span class="icon-warning"></span> Reset Password</h4>
                        </div>
                        
                        <!--Form-->
                        <form action="UsersServlet" method="post" name="resetForm" novalidate>
                            <div class="form-group">
                                <!--modal body-->
                                <div class="modal-body">
                                    
                                    
                                    <!--verify username-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-user"></span>
                                        </span>
                                        <input ng-model="reset_username" class="form-control" type="text" 
                                               name="resetUsername" placeholder="Enter registered username" required>
                                    </div>
                                    <span ng-show="resetForm.resetUsername.$dirty && resetForm.resetUsername.$invalid"
                                          style="color: red;">
                                        <span ng-messages="resetForm.resetUsername.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>

                                    <!--verify email-->
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-addon">
                                            <span class="icon-envelope"></span>
                                        </span>
                                        <input type="email" class="form-control" name="resetUserEmail" placeholder="Enter registered email" required
                                               ng-model="email">
                                    </div>
                                    <span ng-show="resetForm.resetUserEmail.$dirty && resetForm.resetUserEmail.$invalid" style="color: red;">
                                        <span ng-messages="resetForm.resetUserEmail.$error" ng-messages-include="_js/_common/angular/messages.html"></span>
                                    </span>
                                </div>
                                          
                            </div>
                            <!--submit reset button-->
                            <div class="modal-footer">
                                <input ng-disabled="resetForm.$invalid" id="send-reset-btn" class="btn btn-danger btn-lg pull-left" data-dismiss="modal" type="submit" name="submitReset" value="Verify and Send Reset">
                                
                                <!--note-->
                                <div>
                                    <p style="text-align: right;"><span class="icon-envelope"></span> We will send the reset link to <br>your registered email address</p>
                                </div>
                            </div>   
                        </form>
                    </div>
                 </div>
             </div>
            
            
            <!--Messages coming from Servlet-->
            ${message}
                        
                        
        </div>
    </body>
</html>