<%-- 
    Document   : manage-nutrition-library.jsp
    Version    : Jan 15, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: html page for staff to manage the nutrition library
--%>

<%--@page import="org.owasp.encoder.Encode"--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@page import="org.owasp.encoder.Encoder" --%>

<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/nutritionist/header-scriptlet-nutritionistJSP.jspf" %>
<!--end of redirect scriptlet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>Manage Journal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/nutritionist/CDN-nutritionistJSP.jspf"></c:import>
	<!--end of CDN definitions-->
        
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="manageJournalApp">
            
            <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
            
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/common/nav-common.jspf" %>
	    <!--end of navigation bar definitions-->

            <!--============================================================-->
            <!--ENTER YOUR HTML HERE-->
            
		<!--calorie table - style using W#.CSS - has angular component -->
		<c:import url="WEB-INF/jspf/nutritionist/patient-journal.jspf"></c:import>
		<!--end of calorie table definitions-->
            
            <!--============================================================-->
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition--> 
            
            
            <!-- +++++++++++++++++++++++++++popups+++++++++++++++++++++++++++ -->
            
            <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->
            
            <!--============================================================-->
            <!--Messages coming from Servlet-->
	    <%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    <!--end messages from servlet definitions-->
        </div>
    </body>
</html>
