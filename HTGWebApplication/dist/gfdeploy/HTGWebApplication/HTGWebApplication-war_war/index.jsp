<%-- 
    Document   : index.jsp
    Version    : Dec 25, 2016
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: default home page
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/main/header-scriplet-main.jspf" %>
<!--end of redirect scriplet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>Health To Go Nutrition Care</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!--CDNs-->
	<c:import url="WEB-INF/jspf/main/cdn-main.jspf"></c:import>
	<!--end of CDN definitions-->
        
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
            
            <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
	    
	    
            <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/main/nav-main.jspf" %>
	    <!--end of navigation bar definitions-->
	    
	    
	    <!--============================================================-->
            <!--ENTER YOUR HTML HERE-->

	    <div class="all-pages w3-row w3-container container-fluid">
		<div class="w3-col l10 s12 w3-center">
		    
		    <!--============================================================-->
		    <!--main page-->
		    <c:import url="WEB-INF/jspf/main/main-page-main.jspf"></c:import>
		    <!--end of main page definitions-->

		    <!--============================================================-->
		    <div>
			<!--Second page - Services-->
			<c:import url="WEB-INF/jspf/main/services-main.jspf"></c:import>
			<!--end of services definitions-->
			

			<hr>
			<!--============================================================-->
			<!--Third page - About ME--> 
			<c:import url="WEB-INF/jspf/main/about-me-page-main.jspf"></c:import>
			<!--end of services definitions-->
		    </div>

		</div>
		
		
		<!--============================================================-->
		<!--Quick links on right side of main page--> 
		<c:import url="WEB-INF/jspf/main/quick-links-on-right-side-main.jspf"></c:import>
		<!--end of quick links definition-->
		
		
	    </div>
                    
            <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->
            
            
            <!-- +++++++++++++++++++++++popups+++++++++++++++++++++++ -->
            
            <!--login modal popup-->
	    <c:import url="WEB-INF/jspf/common/login-popup-common.jspf"></c:import>
	    <!--end of login modal popup-->
	    
            
            <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->
	    
	    
            <!--modal sign up popup-->
	    <c:import url="WEB-INF/jspf/common/sign-up-popup-common.jspf"></c:import>
	    <!--end of sign up modal popup-->
            
	    
            <!--modal popup for require login-->
	    <c:import url="WEB-INF/jspf/common/require-login-popup-common.jspf"></c:import>
	    <!--end of require login modal popup-->
            
	    
            <!--forgot password-->
            <c:import url="WEB-INF/jspf/common/forgot-password-popup-common.jspf"></c:import>
	    <!--end of require login modal popup-->
            
	    
            <!--Messages coming from Servlet-->
	    <%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    <!--end messages from servlet definitions-->
                        
        </div>
    </body>
</html>

