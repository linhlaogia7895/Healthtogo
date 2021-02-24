<%-- 
    Document   : adverts-all.jsp
    Created on : Feb 20, 2017, 3:26:58 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: jsp for all adverts
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/staff/client-side/adverts/header-scriptlet-client-adverts.jspf" %>
<!--end of redirect scriplet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>News & Opportunities</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/staff/client-side/adverts/cdn-client-adverts.jspf"></c:import>
	<%--<jsp:include page="WEB-INF/jspf/staff/client-side/adverts/cdn-client-adverts-alternative.jspf" flush="true"></jsp:include>--%>
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
            
            
            <!--ENTER YOUR HTML HERE-->

            <div class="main-body w3-container container-fluid">
                
                <!--side navbar - style from W3.CSS -->
		<c:import url="WEB-INF/jspf/staff/client-side/adverts/nav-side-client-adverts.jspf"></c:import>
		<!--end of side-nav definitions-->
		
                
                <!--margin left makes sure there's space for side navbar-->
                <div style="margin-left:70px">
                    
		    
		    <!--============================================================-->
                    <!--news section - style using W#.CSS - has angular component -->
		    <c:import url="WEB-INF/jspf/staff/client-side/adverts/news-section-client-adverts.jspf"></c:import>
		    <!--end of news section definitions-->
		    
		    
		    <!--============================================================-->
		    <!--promos section - style using W#.CSS - has angular component -->
		    <c:import url="WEB-INF/jspf/staff/client-side/adverts/promos-section-client-adverts.jspf"></c:import>
		    <!--end of promos section-->
		    
		    
		    <!--============================================================-->
		    <!--career section - style using W#.CSS - has angular component -->
		    <c:import url="WEB-INF/jspf/staff/client-side/adverts/career-section-client-adverts.jspf"></c:import>
		    <!--end of career section definitions-->
		    
		    
		    <!--============================================================-->
		    <!--intern section - style using W#.CSS - has angular component -->
		    <c:import url="WEB-INF/jspf/staff/client-side/adverts/intern-section-client-adverts.jspf"></c:import>
		    <!--end of intern section definitions-->
		    
		    
		    <!--============================================================-->
		    <!--volunteer section - style using W#.CSS - has angular component -->
		    <c:import url="WEB-INF/jspf/staff/client-side/adverts/volunteer-section-client-adverts.jspf"></c:import>
		    <!--end of volunteer section definitions-->
		    
                </div>
            </div>
		
                
	    <!--footer definition-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->
            
            
            
            <!-- +++++++++++++++++++++++popups+++++++++++++++++++++++ -->
            
            <!--login modal popup-->
	    <c:import url="WEB-INF/jspf/common/login-popup-common.jspf"></c:import>
	    <!--end of login modal popup-->
	    
            
            <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->
	    
	    
            <!--modal sign up popup-->
	    <c:import url="WEB-INF/jspf/common/sign-up-popup-common.jspf"></c:import>
	    <!--end of sign up modal popup-->
            
	    
            <!--modal popup for require login-->
	    <c:import url="WEB-INF/jspf/common/require-login-popup-common.jspf"></c:import>
	    <!--end of require login modal popup-->
            
	    
            <!--forgot password-->
            <c:import url="WEB-INF/jspf/common/forgot-password-popup-common.jspf"></c:import>
	    <!--end of require login modal popup-->
            
            
            <!--Messages coming from Servlet-->
	    <%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    <!--end messages from servlet definitions-->
                        
        </div>
    </body>
</html>