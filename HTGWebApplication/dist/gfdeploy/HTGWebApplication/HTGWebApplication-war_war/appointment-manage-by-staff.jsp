<%-- 
    Document   : appointment-patient.jsp
    Created on : Feb 20, 2017, 3:26:58 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: jsp for patient appointment booking
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>--%>

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
	    <div ng-controller="managePatientAppointmentsController">
		<!--logo-header-->
		<c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>

		<!--Navigation bar-->
		<%@include file="WEB-INF/jspf/main/nav-main.jspf" %>

		<!--------------------------HTML CORE------------------------------>

		<!--manage appointment main functionality-->
		<c:import url="WEB-INF/jspf/patient/patient-appointment/manage-appointment-with-search-and-list.jspf"></c:import>

		<!-------------------------FOOTER------------------------------->
		<!--footer definition-->
		<c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>

		<!-------------------------POPUP------------------------------->
		<!--contact modal popup-->
		<c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    </div>
	</div>
    </body>
</html>

