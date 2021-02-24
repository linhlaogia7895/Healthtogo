<%@page import="java.util.HashMap"%>
<%-- 
    Document   : patientJournal.jsp
    Created on : Jan 18, 2017, 9:54:09 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for patient journal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>

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
                    <div class="well">
                       <h2 class="text-center"><img src="img/logo.jpg" >&nbsp;&nbsp;Checkout with PayPal</h2>
                    </div>
                    <div class="row-fluid">    
                        <div class="span4">
                            </div>
                        <div class="span5">
                                <table>
                                        <tbody>
                                                <tr><td><h3>Shipping Address</h3></td><td>&nbsp;&nbsp;</td><td><h3>Billing Address</h3></td></tr>
                                                <% HashMap result = (HashMap) request.getAttribute("result");  %>
                                                <tr><td><%=result.get("PAYMENTREQUEST_0_SHIPTONAME")%></td><td>&nbsp;&nbsp;</td><td><%=result.get("PAYMENTREQUEST_0_SHIPTONAME")%></td></tr>
                                                <tr><td><%=result.get("PAYMENTREQUEST_0_SHIPTOSTREET")%></td><td>&nbsp;&nbsp;</td><td><%=result.get("PAYMENTREQUEST_0_SHIPTOSTREET")%></td></tr>
                                                <tr><td><%=result.get("PAYMENTREQUEST_0_SHIPTOCITY")%></td><td>&nbsp;&nbsp;</td><td><%=result.get("PAYMENTREQUEST_0_SHIPTOCITY")%></td></tr>
                                                <tr><td><%=result.get("PAYMENTREQUEST_0_SHIPTOSTATE")%></td><td>&nbsp;&nbsp;</td><td><%=result.get("PAYMENTREQUEST_0_SHIPTOSTATE")%></td></tr>
                                                <tr><td><%=result.get("PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE")%></td>&nbsp;&nbsp;<td></td><td><%=result.get("PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE")%></td></tr>
                                                <tr><td><%=result.get("PAYMENTREQUEST_0_SHIPTOZIP")%></td>&nbsp;&nbsp;<td></td>&nbsp;<td><%=result.get("PAYMENTREQUEST_0_SHIPTOZIP")%></td></tr>
                                                <tr><td colspan="3">&nbsp;</td></tr>
                                                <tr><td colspan="3">&nbsp;</td></tr>

                                                <tr><td>Total Amount:</td><td>&nbsp;&nbsp;</td><td id='amount'><%=result.get("PAYMENTREQUEST_0_AMT")%></td></tr>
                                                <tr><td>Currency Code:</td><td>&nbsp;&nbsp;</td><td><%=result.get("CURRENCYCODE")%></td></tr>
                                                <tr><td>&nbsp;</td></tr>
                                                
                                                </tbody>
                                </table>
                                                <form action="Return?page=return" name="order_confirm" method="POST">                                            
                                                        <input type="Submit" name="confirm" alt="Check out with PayPal" class="btn btn-primary btn-large" value="Confirm Order">
                                                </form>

                        </div>
                                                <br>
                        
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
    </body>
</html> 