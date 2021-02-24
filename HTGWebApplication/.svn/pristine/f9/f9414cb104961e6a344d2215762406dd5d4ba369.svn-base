<%-- 
    Document   : createNewStaffAccount.jsp
    Created on : Jan 17, 2017, 5:58:48 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: Registration form for creating new staff account by calling the form from  web-inf
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
	  <c:import url="WEB-INF/jspf/admin/create-new-staff-account/cdn-create-new-staff-account.jspf"></c:import>
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
	    
	    <!--form form registration-->
	    <c:import url="WEB-INF/jspf/admin/create-new-staff-account/form-registration.jspf"></c:import>
	    <!--end of form definitions-->
	    
	    <!--not sure what this is-->
	    <%@include file="WEB-INF/jspf/admin/create-new-staff-account/raw.jspf" %>
	    
	</div>
        
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->
	    
        </div>
    </body>
</html>
