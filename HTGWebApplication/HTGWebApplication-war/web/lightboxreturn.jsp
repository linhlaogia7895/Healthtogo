<%@ page import="java.util.Map" %>
<<%@page import="java.util.HashMap"%>
<%-- 
    Document   : patientJournal.jsp
    Created on : Jan 18, 2017, 9:54:09 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for patient journal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" --%>
<%
String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

url = url + "Return?page=return&";


Map<String, String[]> parameters = request.getParameterMap();
for (Map.Entry<String, String[]> entry : parameters.entrySet()) {
    url += entry.getKey() + "=" + request.getParameter(entry.getKey()) + "&";
        
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>HTG Nutritionist Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--This meta statement tells individual devices not to scale the web page but rather to use the scale of 1. 
        Meaning, if we are on a device that's 700px across, it will render the page as if there were on 700px, 
        allowing the rest of the HTML to move around. The device will not attempt to show the entire page and scale it 
        down-->
        <meta name="Viewport" content="width=device-width, initial-scale=1"> 
	
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/patient/invoice/cdn-my-invoice.jspf"></c:import>
	<!--end of CDN definitions-->
        
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="">
            
                        <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/patient/nav-main-PatientJSP.jspf" %>
	    <!--end of navigation bar definitions-->

            <!--DATE PICKER FOR JOURNAL-->
            
            <!--INPUT TEXT BOX FOR PATIENT JOURNAL-->
	    <div class="container">
                <div class="container-fluid">
                    <div class="row-fluid"> 

                    <div class="span4">
                    </div>
                        <div class="span5"></div>
                    <div class="row text-center"><h3>Loading...</h3></div>
                    </div> <!-- Row-Fluid ends here -->
		</div>  <!--Container-Fluid ends here -->
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>
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
            <script type="text/javascript">
                if (window!=top){top.location.href='<%=url%>';} //lightbox return
                else
                window.location.href='<%=url%>'; //return from full page paypal flow
            </script>
    </body>
</html> 
