<%-- 
    Document   : manage-nutrition-library.jsp
    Version    : Jan 15, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: html page for staff to manage the nutrition library
--%>

<%@page import="org.owasp.encoder.Encode"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.owasp.encoder.Encoder" %>

<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/main/nutrition-library/staff-side/header-scriptlet-staff-nlibrary.jspf" %>
<!--end of redirect scriptlet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>Manage Library</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/main/nutrition-library/staff-side/cdn-staff-nlibrary.jspf"></c:import>
	<!--end of CDN definitions-->
        
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="staffApp">
            
            <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
            
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/common/nav-common.jspf" %>
	    <!--end of navigation bar definitions-->

            <!--============================================================-->
            <!--ENTER YOUR HTML HERE-->
            <div class="main-body container-fluid">
                
		
                <!--side navbar - style from W3.CSS -->
		<c:import url="WEB-INF/jspf/main/nutrition-library/staff-side/nav-side-nlibrary-staff.jspf"></c:import>
		<!--end of side-nav definitions-->
                
		
                <!--margin left makes sure there's space for side navbar-->
                <div style="margin-left:70px">
                    
		<!--calorie table - style using W#.CSS - has angular component -->
		<c:import url="WEB-INF/jspf/main/nutrition-library/staff-side/calorie-section-nlibrary-staff.jspf"></c:import>
		<!--end of calorie table definitions-->
		
		
		<!--============================================================-->
		<!--tips table - style using W#.CSS - has angular component -->
		<c:import url="WEB-INF/jspf/main/nutrition-library/staff-side/tips-section-nlibrary-staff.jspf"></c:import>
		<!--end of tips table definitions-->
		

		<!--============================================================-->
		<!--faq table - style using W#.CSS - has angular component -->
		<c:import url="WEB-INF/jspf/main/nutrition-library/staff-side/faq-section-nlibrary-staff.jspf"></c:import>
		<!--end of faq table definitions-->
		
                    
                </div>
            </div>
            
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
