<%@page import="java.util.HashMap"%>
<%-- 
    Document   : patientJournal.jsp
    Created on : Jan 18, 2017, 9:54:09 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for patient journal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" --%>

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
                        <% if((request.getAttribute("ack").equals("SUCCESS") || request.getAttribute("ack").equals("SUCCESSWITHWARNING") ) && request.getAttribute("payment_method").equals("credit_card") ) { 
                                HashMap<String,String> result = (HashMap<String,String>) request.getAttribute("result");
                        %>
                            
                            
                                    
                            <!-- Display the Transaction Details-->
                                    <h3> <%=result.get("credit_card_first_name")%>
                                            <%=result.get("credit_card_last_name")%> , Thank you for your Order </h3>

                                            <h3>Shipping Details:</h3>
                                    <%=result.get("L_PAYMENTREQUEST_FIRSTNAME")%> <%=result.get("L_PAYMENTREQUEST_LASTNAME")%><br>
                                            <%=result.get("PAYMENTREQUEST_0_SHIPTOSTREET")%><br>
                                            <%=result.get("PAYMENTREQUEST_0_SHIPTOCITY")%><br>

                                            <%=result.get("PAYMENTREQUEST_0_SHIPTOSTATE")%>- <%=result.get("PAYMENTREQUEST_0_SHIPTOZIP")%></p>
                                    <p>Transaction ID: <%=result.get("TRANSACTIONID")%> </p>

                                    <p>Payment Total Amount: <%=result.get("AMT")%> </p>
                                    <p>Currency Code: <%=result.get("CURRENCYCODE")%> </p>

                                    <h3> Click <a href='RedirectServlet?url=uCEnu7FrA9+Rm2vqCKEkOMBSm1HXKmi5RvX6O5jrd5Q='>here </a> to return to Home Page</h3>

                                    
                            
                            
                        <% } else if((request.getAttribute("ack").equals("SUCCESS") || request.getAttribute("ack").equals("SUCCESSWITHWARNING") ) ) { 
                                HashMap<String,String> result = (HashMap<String,String>) request.getAttribute("result");
                        %>
                                                <span class="span4">
                                        </span>
                                        <span class="span5">
                                                <div class="hero-unit">
                                        <!-- Display the Transaction Details-->
                                                <h4> <%=result.get("FIRSTNAME")%>
                                                        <%=result.get("LASTNAME")%> , Thank you for your Order </h4>

                                                <h3> Shipping Details: </h3>
                                                <%=result.get("PAYMENTREQUEST_0_SHIPTONAME")%><br>
                                                        <%=result.get("PAYMENTREQUEST_0_SHIPTOSTREET")%><br>
                                                        <%=result.get("PAYMENTREQUEST_0_SHIPTOCITY")%><br>

                                                        <%=result.get("PAYMENTREQUEST_0_SHIPTOSTATE")%>- <%=result.get("PAYMENTREQUEST_0_SHIPTOZIP")%></p>
                                                <p>Transaction ID: <%=result.get("PAYMENTINFO_0_TRANSACTIONID")%> </p>
                                                <p>Transaction Type: <%=result.get("PAYMENTINFO_0_TRANSACTIONTYPE")%> </p>
                                                <p>Payment Total Amount: <%=result.get("PAYMENTINFO_0_AMT")%> </p>
                                                <p>Currency Code: <%=result.get("PAYMENTINFO_0_CURRENCYCODE")%> </p>
                                                <p>Payment Status: <%=result.get("PAYMENTINFO_0_PAYMENTSTATUS")%> </p>
                                                <p>Payment Type: <%=result.get("PAYMENTINFO_0_PAYMENTTYPE")%> </p>
                                                <h3> Click <a href='RedirectServlet?url=uCEnu7FrA9+Rm2vqCKEkOMBSm1HXKmi5RvX6O5jrd5Q='>here </a> to return to Home Page</h3>

                                                </div>
                                        </span>
                                        <span class="span3">
                                        </span>

                        <% } else { 
                                HashMap<String,String> result = (HashMap<String,String>) request.getAttribute("result");
                        %>

                        <div class="hero-unit">
                                                <!-- Display the Transaction Details-->
                                                <h4> There is a Funding Failure in your account. You can modify your funding sources to fix it and make purchase later. </h4>
                                                Payment Status: <%=result.get("PAYMENTINFO_0_PAYMENTSTATUS")%>


                                                <h3> Click <a href='https://www.sandbox.paypal.com/'>here </a> to go to PayPal site.</h3> <!--Change to live PayPal site for production-->
                                                </div>

                        <% } %>	
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