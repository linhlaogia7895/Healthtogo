<%-- 
    Document   : page-construction.jsp
    Created on : April 8, 2017, 3:26:58 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: jsp for page under construction
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Appointment</title>

	<!--CDN-->
	<c:import url="WEB-INF/jspf/patient/patient-appointment/cdn-patient-appointment.jspf"></c:import>
	
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
	    
	    <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/common/nav-common.jspf" %>
	    <!--end of navigation bar definitions-->
	    
	    <!------------------------------------------------------ HEADER ABOVE-->

	    <!--page under construction-->
	    <img id="page-construction" src="_res/common/page-under-construction.gif" style="max-width: 100%; margin-bottom: 10px;" alt="Page under construction">

	    <!------------------------------------------------------ FOOTER BELOW-->
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
	    
	    <!------------------------------------------------------ POPUP BELOW-->
	    <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	</div>
    </body>
</html>
