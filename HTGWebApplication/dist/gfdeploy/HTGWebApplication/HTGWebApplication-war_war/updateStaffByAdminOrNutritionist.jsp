<%-- 
    Document   : updateStaffByAdminOrNutritionist.jsp
    Created on : Jan 28, 2017, 11:36:53 AM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for updating staff by admin or nutritionist by calling the form in the web-inf
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
	<c:import url="WEB-INF/jspf/staff/update-staff-by-admin-or-nutritionist/cdn-update-staff-by-admin-nutritionist.jspf"></c:import>
	<!--end of CDN definitions-->
  </head>
        
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
            
	    <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
	    
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/common/nav-common.jspf" %>
	    <!--end of navigation bar definitions-->
            
            <div class="container">
		
		<!--form for updating staff by admin or nutritionist-->
		<%@include file="WEB-INF/jspf/staff/update-staff-by-admin-or-nutritionist/form-update-staff-by-admin-nutritionist.jspf" %>
		<!--end of form definitions-->
		
		<br/>
	    </div>
            
            
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
	    <!--end of footer definition-->

	    <!-- +++++++++++++++++++++++++++popups+++++++++++++++++++++++++++ -->

	    <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->

	    <!--Messages coming from Servlet-->
	    <%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    <!--end messages from servlet definitions-->
            
        </div>
    </body>
</html>
