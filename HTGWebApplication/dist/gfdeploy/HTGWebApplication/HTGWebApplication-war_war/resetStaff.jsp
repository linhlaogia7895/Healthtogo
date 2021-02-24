<%-- 
    Document   : resetStaff.jsp
    Created on : Feb 4, 2017, 10:02:05 AM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP that handle the reset login for the staff being called from the jspf in the we-inf
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>

<!DOCTYPE html>
<html>
    <head>
	<title>Reset Staff</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--This meta statement tells individual devices not to scale the web page but rather to use the scale of 1. 
        Meaning, if we are on a device that's 700px across, it will render the page as if there were on 700px, 
        allowing the rest of the HTML to move around. The device will not attempt to show the entire page and scale it 
        down-->
        <meta name="Viewport" content="width=device-width, initial-scale=1"> 
        
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/staff/reset-staff/cdn-reset-staff.jspf"></c:import>
	<!--end of CDN definitions-->
    </head>
    
    <body>
	<!--logo-header-->
	<c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	<!--end of logo header definitions-->

	<!--Navigation bar-->
	<%@include file="WEB-INF/jspf/common/nav-common.jspf" %>
	<!--end of navigation bar definitions-->
        
	<%
	    //String theStaffID = request.getParameter("staffID");
	%>

	<div class="container">
	    <!--form for reset staff-->
	    <c:import url="WEB-INF/jspf/staff/reset-staff/form-registration-for-reset-staff.jspf"></c:import>
	    <!--end of form definitions-->
	</div>
 
	<!--footer definition-->
	<c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
	<!--end of footer definition-->
    </body>
</html>
