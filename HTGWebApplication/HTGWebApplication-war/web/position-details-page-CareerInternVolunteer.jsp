<%-- 
    Document   : client-patient-adverts.jsp
    Created on : March 5, 2017, 3:26:58 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: jsp for details of positions in career, intern and volunteer pages
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/staff/client-side/adverts/header-scriptlet-client-adverts.jspf" %>
<!--end of redirect scriplet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Position Details</title>
	
	<!--CDNs-->
	<%--<c:import url="WEB-INF/jspf/staff/client-side/adverts/cdn-client-adverts.jspf"></c:import>--%>
	<c:import url="WEB-INF/jspf/staff/client-side/adverts/cdn-position-details-file-uploads-page.jspf"></c:import>
	<!--end of CDN definitions-->
    </head>
    <body class="w3 w3-container container-fluit">
        
	<!--career details page-->
	<%@include file="WEB-INF/jspf/staff/client-side/adverts/details-pages/career-details.jspf" %>
	<!--end of career details definitions-->
	
	
	<!--intern details page-->
	<%@include file="WEB-INF/jspf/staff/client-side/adverts/details-pages/intern-details.jspf" %>
	<!--end of intern details definitions-->
	
	<!--volunteer details pages-->
	<%@include file="WEB-INF/jspf/staff/client-side/adverts/details-pages/volunteer-details.jspf" %>
	<!--end of volunteer details definitions-->
	
	
	<!--Messages coming from Servlet-->
	<%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	<!--end messages from servlet definitions-->
    </body>
</html>
