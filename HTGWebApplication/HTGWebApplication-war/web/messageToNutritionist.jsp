<%-- 
    Document   : messageToNutritionist.jsp
    Version    : Jan 5, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: html page for patient
--%>

<%@page import="common.VerifySecurityHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

VerifySecurityHelper v=VerifySecurityHelper.getInstance();
if(!v.isLoggedIn(request, response))
    if(!v.isGuest(request, response))
	response.sendRedirect("MainPageServlet?notAuthorized=message-nutritionist");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>HTG Admin Page</title>
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

        <!--Custom-made JS and CSS. Important: MUST CHANGE ALL PATHS HERE WHEN FILE IS MOVED-->

        <script src="_js/patient/patient.js" type="text/javascript"></script>
        <script src="_js/_common/common.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="_css/common/common.css">
        <link rel="stylesheet" type="text/css" media="screen" href="_css/patient/patient.css">

	<link href="https://fonts.googleapis.com/css?family=Aladin|Fredericka+the+Great|Great+Vibes|Kaushan+Script|Nixie+One|Oleo+Script|Playball|Shrikhand|Tangerine" rel="stylesheet"> 
    </head>
    

    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="">

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

                            <!--account is a common usertype menu and present on all pages for testing purposes-->
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                                    Account

                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">(5) Reset Login</a></li>
                                    <li><a href="#">(6) Create / Update account</a></li>
                                    <li><a href="paymentPlan.jsp">(8) Payment plan</a></li>
                                    <li><a href="#">(10) Pay for service</a></li>
                                    <li><a href="messageToNutritionist.jsp">(12) Send message to nutritionist</a></li>
                                    <li><a href="#">(13) Patient journal</a></li>
                                    <li><a href="#">(19) Search FAQ, tips and nutrition library</a></li>
                                    <li><a href="adverts-all.jsp">(22) Subscribe to advert(s)</a></li>
                                    <li><a href="#">(26) Manage invoice</a></li>
                                    <li><a href="#">(27) Book appointment</a></li>
                                </ul>
                            </li>

                            <!--check UsersServlet.java and HtmlPageHelper.java for the contents of classRequireLogin-->
                            ${userTypeMenu}

                        </ul>

                        <!--Sign up and login using glyph icons of bootstrap 3-->
                        <ul class="nav navbar-nav navbar-right nav-toggle">

                            <!--check UsersServlet.java and HtmlPageHelper.java for the contents of navBarElements-->
                            ${navBarElements}
                        </ul>
                    </div>
                </div>
            </nav>




            <!--ENTER YOUR HTML HERE-->

            <a href="mailto:htg.nutrition@gmail.com">Contact Me</a>
            
            
            <!--email section-->
            
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

            <div class="container">
                <div class="row inbox">
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-body inbox-menu">						
                                <a href="#page-inbox-compose.html" class="btn btn-danger btn-block">New Email</a>
                                <ul>
                                    <li>
                                        <a href="#"><i class="fa fa-inbox"></i> Inbox <span class="label label-danger">4</span></a>
                                    </li>

                                    <li>
                                        <a href="#"><i class="fa fa-rocket"></i> Sent</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-trash-o"></i> Trash</a>
                                    </li>


                                </ul>
                            </div>	
                        </div>


                    </div><!--/.col-->

                    <div class="col-md-9">
                        <div class="panel panel-default">
                            <div class="panel-body message">
                                <p class="text-center">New Message</p>
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="to" class="col-sm-1 control-label">To:</label>
                                        <div class="col-sm-11">
                                            <input type="email" class="form-control select2-offscreen" id="to" placeholder="Type email" tabindex="-1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="sub" class="col-sm-1 control-label">Subject:</label>
                                        <div class="col-sm-11">
                                            <input type="subject" class="form-control select2-offscreen" id="sub" placeholder="Type subject" tabindex="-1">
                                        </div>
                                    </div>


                                </form>


                                <br>	

                                <div class="form-group">
                                    <textarea class="form-control" id="message" name="body" rows="12" placeholder="Click here to reply"></textarea>
                                </div>

                                <div class="form-group">	
                                    <button type="submit" class="btn btn-success">Send</button>
                                    <button type="submit" class="btn btn-default">Draft</button>
                                    <button type="submit" class="btn btn-danger">Discard</button>
                                </div>
                            </div>	
                        </div>	
                    </div>	
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




        <!-- ----------------------popups-------------------- -->

        <!--contact modal popup-->
        <div class="modal fade" id="modal-contact-popup" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">

                        <!--close button-->
                        <button type="button" class="close" data-dismiss="modal"><span class="icon-remove"></span></button>

                        <!--contact header-->
                        <h4><span class="icon-envelope"></span> Contact</h4>
                    </div>
                    <!--form USING ANGULAR JS--> 
                    <form action="MainPageServlet" method="post" name="myForm">

                        <!--modal body-->
                        <div class="modal-body">
                            <div class="form-group">

                                <!--enter name-->
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon">
                                        <span class="icon-user"></span>
                                    </span>
                                    <input type="text" class="form-control" name="contactName" placeholder="Enter your name" autofocus required>
                                </div>

                                <!--enter email-->
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon">
                                        <span class="icon-envelope"></span>
                                    </span>
                                    <input type="email" class="form-control" name="contactEmail" placeholder="Enter email" required
                                           ng-model="email">
                                </div>
                                <span ng-show="myForm.contactEmail.$dirty && myForm.contactEmail.$invalid" style="color: red;">
                                    <span ng-show="myForm.contactEmail.$error.email">Invalid email address</span>
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
                                    <textarea class="form-control" name="message" rows="10" placeholder="Enter your message" required></textarea>
                                </div>
                                <br>

                                <!--submit button-->
                                <input id="contact-btn" class="btn btn-danger pull-left" type="submit" name="submitMessage" value="Send Message">
                            </div>
                        </div>

                        <!--footer-->
                        <div class="modal-footer">
                            <h5 id="address-link"><a target="_blank" href="https://www.google.ca/maps/dir//140+Castlebrook+Rise+NE,+AB+T3J+1P1,+CANADA/@51.1050826,-113.9695245,16z/data=!3m1!4b1"><span class="icon-map-marker"> 140 Castlebrook Rise NE, AB T3J 1P1, CANADA</span></a></h5>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</body>
</html>
