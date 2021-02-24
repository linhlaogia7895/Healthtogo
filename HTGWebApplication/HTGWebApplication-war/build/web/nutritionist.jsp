<%-- 
    Document   : nutritionist.jsp
    Version    : Jan 5, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: html page for nutritionist
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/nutritionist/header-scriptlet-nutritionistJSP.jspf" %>
<!--end of redirect scriplet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>HTG Nutritionist Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--This meta statement tells individual devices not to scale the web page but rather to use the scale of 1. 
        Meaning, if we are on a device that's 700px across, it will render the page as if there were on 700px, 
        allowing the rest of the HTML to move around. The device will not attempt to show the entire page and scale it 
        down-->
        <meta name="Viewport" content="width=device-width, initial-scale=1"> 
        
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/nutritionist/CDN-nutritionistJSP.jspf"></c:import>
	<!--end of CDN definitions-->
        
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="">
            
            <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
            
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/nutritionist/nav-main-nutritionistJSP.jspf" %>
	    <!--end of navigation bar definitions-->

            
            <!--ENTER YOUR HTML HERE-->
            
	    <!--Body button links-->
	    <c:import url="WEB-INF/jspf/nutritionist/body-button-links-nutritionist-main.jspf"></c:import>
	    <!--end of button links definitions-->
            
            
	    <!--footer section-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->
            
            
            <!-- +++++++++++++++++++++++++++popups+++++++++++++++++++++++++++ -->
            
 	    <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->
            
	    <!--Messages from servlet-->
	    <%@include file="WEB-INF/jspf/staff/staff-side/main/servlet-messages-staff-main.jspf" %>
	    <!--end of servlet messages definitions-->
            
        </div>
    </body>
</html>