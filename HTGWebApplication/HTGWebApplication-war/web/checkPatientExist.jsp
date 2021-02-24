<%-- 
    Document   : checkPatientExist.jsp
    Created on : Feb 10, 2017, 4:33:38 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: Checks if patient exists
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-nor-guest.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <title>HTG Admin Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--This meta statement tells individual devices not to scale the web page but rather to use the scale of 1. 
        Meaning, if we are on a device that's 700px across, it will render the page as if there were on 700px, 
        allowing the rest of the HTML to move around. The device will not attempt to show the entire page and scale it 
        down-->
        <meta name="Viewport" content="width=device-width, initial-scale=1"> 
        
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/admin/check-patient-exist/cdn-check-patient-exist.jspf"></c:import>
	<!--end of CDN definitions-->
	
    </head>
      
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="">
            
            <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
	    
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/common/nav-common.jspf" %>
	    <!--end of navigation bar definitions-->
	    
	    <div class="container">
		<!--form for getting patient details-->
		<c:import url="WEB-INF/jspf/admin/check-patient-exist/form-patient-login-details.jspf"></c:import>
		<!--end of form definitions-->
		
		<br/>
	    </div>                 
                        
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->                
        </div>
    </body>
</html>
