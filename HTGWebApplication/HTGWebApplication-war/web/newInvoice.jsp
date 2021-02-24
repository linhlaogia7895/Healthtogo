<%-- 
    Document   : newInvoice
    Created on : Apr 5, 2017, 11:22:23 AM
    Author     : 659621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>

<!--redirect scriptlet-->
<%--<%@include file="WEB-INF/jspf/staff/staff-side/main/header-scriplet-staff-main.jspf" %>--%>
<!--end of redirect scriplet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>HTG Staff Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="Viewport" content="width=device-width, initial-scale=1"> 
	<!--CDNs-->
	<c:import url="WEB-INF/jspf/staff/staff-side/main/cdn-staff-main.jspf"></c:import>
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
	    
                        
            <!--ENTER YOUR HTML HERE -->
	    
	    <!--ENTER YOUR HTML HERE-->
            
         
                           <!-- Search text box to add an invoice to a patient -->
                           
                         
<div class="container"> 

  <form class="form-inline" action="SearchPatientInvoice" method="POST">
 <div class="form-group">
 <label for="fname">First Name:</label>
 <input type="text" class="form-control" id="firstName" name="invoiceFirstName" placeholder="Enter First Name">
</div>
 <div class="form-group">
 <label for="lname">Last Name:</label>
 <input type="text" class="form-control" id="lastName" name="invoiceLastName" placeholder="Enter Last Name">
</div>
 <div class="form-group">
<label for="phn">Phone:</label>
<input type="text" class="form-control" id="pwd" name="invoicePhoneNumber" placeholder="Enter phone">
</div>
      <button type="submit" class="btn btn-default" name="submitInvoiceUpdate"  value="true">Search</button>
</form>

    
</div>
                           
  <br>  
  ${message}
	    

            <!--footer section-->
	    <c:import url="WEB-INF/jspf/common/footer-common.jspf"></c:import>
            <!--end of footer definition-->
            
            
            <!-- +++++++++++++++++++++++++++popups+++++++++++++++++++++++++++ -->
            
	    <!--contact modal popup-->
	    <c:import url="WEB-INF/jspf/common/contact-popup-common.jspf"></c:import>
	    <!--end of contact modal popup-->
            
            
	    <!--Messages from servlet-->
	    <%@include file="WEB-INF/jspf/staff/staff-side/main/servlet-messages-staff-main.jspf" %>
	    <!--end of servlet messages definitions-->
            
        </div>
    </body>
</html>
