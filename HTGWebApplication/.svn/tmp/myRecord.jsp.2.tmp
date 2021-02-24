<%-- 
    Document   : myRecord.jsp
    Created on : Feb 20, 2017, 8:40:44 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for patient's record
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>

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
	
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/patient/my-record/cdn-my-record.jspf"></c:import>
	<!--end of CDN definitions-->
        
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
            
                        <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
	    
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/patient/nav-main-PatientJSP.jspf" %>
	    <!--end of navigation bar definitions-->
	    
	    <!--My Record details-->
	    <%@include file="WEB-INF/jspf/patient/my-record/table-my-record.jspf" %>
	    <!--end of my record definitions-->
	    
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->
	    
            <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->
            
            <!--Messages coming from Servlet-->
	    <%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    <!--end messages from servlet definitions-->   
        </div>
    </body>
</html>