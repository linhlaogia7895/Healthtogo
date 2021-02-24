<%-- 
    Document   : createPatientInvoiceByStaff
    Created on : Apr 10, 2017, 10:17:20 PM
    Author     : 659621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--redirect scriptlet-->
<%@include file="WEB-INF/jspf/staff/staff-side/main/header-scriplet-staff-main.jspf" %>
<!--end of redirect scriplet definitions-->

<!DOCTYPE html>
<html>
    <head>
        <title>HTG Staff Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
	<form class="form-horizontal" action="ManagePatientInvoice" method="POST" name="invoiceForm">
            <table class="table table-hover">
                 <thead>
 <tr><th><label class="control-label col-sm-2" for="txt">Invoice Details</label></th></tr>
	       </thead>
               <tbody>
		   <tr><td>
		    <label for="invoiceNum">Invoice Number</label>
		     <div class="input-group">
                         <input id="invoiceNumber" type="text" class="form-control" name="invoiceNumber" placeholder="Enter Invoice Number" required>
		       </div>
		   </td></tr>
		   <tr><td>
                            <label for="patientId">Patient ID </label>
			   <div class="input-group">
			       
			       <input id="patientId" type="text" class="form-control" name="patientId" placeholder="Enter Patient ID" required>
			   </div>
		   </td></tr>
		   <tr><td>
                            <label for="dateInvoice">Date of Invoice:</label>
			   <div class="input-group">
			       <input type="text" id="datepicker" class="form-control" name="dateOfInvoice" placeholder="Enter Date of Invoice">
			   </div>
		   </td></tr>
		   <tr><td>
                             <label for="subT">Sub Total:</label>
			   <div class="input-group">
			       <input type="text" id="subTotal" class="form-control" name="subTotal" placeholder="Enter Sub Total">
			   </div>
		   </td></tr>
		   <tr><td>
                           <label for="taxR">Tax Rate:</label>
			   <div class="input-group">
			       <input type="text" id="taxRate" class="form-control" name="taxRate" placeholder="Enter Tax Rate">
			   </div>
		   </td></tr>
		   <tr><td>
                           <label for="taxable">Taxable Amount:</label>
			   <div class="input-group">
			       <input type="text" id="taxableAmount" class="form-control" name="taxableAmount" placeholder="Enter Taxable Amount">
			   </div>
		   </td></tr>
		   <tr><td>
                           <label for="total">Total:</label>
			   <div class="input-group">
			       <input type="text" id="total" class="form-control" name="total" placeholder="Enter Total">
			   </div>
		   </td></tr>
		   <tr><td>
                            <label for="address">Billing Address:</label>
			   <div class="input-group">
			       <input type="text" id="billAddress" class="form-control" name="billAddress" placeholder="Enter Billing Address">
			   </div>
		   </td></tr>
		   <tr><td>
                           <label for="descp">Description:</label>
			   <div class="input-group">
			       <input type="text" id="description" class="form-control" name="description" placeholder="Enter Billing Address">
			   </div>
		   </td></tr>
		   <tr><td>
                           <label for="dueDate">Due Date:</label>
			   <div class="input-group">
			       <input type="text" id="datepicker" class="form-control" name="dueDate" placeholder="Enter Billing Address">
			   </div>
		   </td></tr>
		   <tr><td>
                           
               </tbody>
            </table>
                     <table class="table table-hover">
	    <tbody>
	   <tr><td>
		    <div class="control-label col-sm-1"><a href="invoice.jsp" class="w3-btn w3-gray" style="width:150px;" role="button">Cancel</a> </div>
		   </td><td>
		     <div class="control-label col-sm-3"><input class="w3-btn w3-green" style="width:150px;" type="submit" name="submitCreateInvoice" value="Create"> </div>   
		   </td></tr>
	    </tbody>
	  </table> 
        
                    </form>
            
            
            
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

