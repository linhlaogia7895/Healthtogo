<%-- 
    Document   : appointment-patient.jsp
    Created on : Feb 20, 2017, 3:26:58 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: jsp for patient appointment booking
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>

	<!--CDN-->
	<c:import url="WEB-INF/jspf/patient/patient-appointment/cdn-patient-appointment.jspf"></c:import>
	
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
	    <div ng-controller="appointment-controller">
		<!--logo-header-->
		<c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>

		<!--Navigation bar-->
		<%@include file="WEB-INF/jspf/common/nav-common.jspf" %>

		<!------------------------------------------------------ HEADER ABOVE-->

		<!--title-->
		<h1 class="table-title">Book Appointment</h1>    

		<div class="w3-container">

		    <!--search box - style in css file-->
		    <%@include file="WEB-INF/jspf/patient/patient-appointment/search-date-box.jspf" %>
		    <br>

		    <!--List of schedules-->
		    <%@include file="WEB-INF/jspf/patient/patient-appointment/list-appointment-schedules.jspf" %>

		</div>
		<br>


		<!------------------------------------------------------ FOOTER BELOW-->
		<!--footer definition-->
		<c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>

		<!------------------------------------------------------ POPUP BELOW-->
		<!--contact modal popup-->
		<c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>

		<!--appointment booker-->
		<c:import url="WEB-INF/jspf/patient/patient-appointment/modal-appointment-booker-get-details.jspf"></c:import>

		<!--cancel appointment-->
		<c:import url="WEB-INF/jspf/patient/patient-appointment/modal-cancel-appointment.jspf"></c:import>

		<!--Messages coming from Servlet-->
		<%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    </div>
	</div>
    </body>
</html>
