<%-- 
    Document   : editAccount.jsp
    Created on : Jan 26, 2017, 7:33:49 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for editing account
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/common/header-not-logged-in-redirect-rightaway.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <title>HTG Patient Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!--This meta statement tells individual devices not to scale the web page but rather to use the scale of 1. 
        Meaning, if we are on a device that's 700px across, it will render the page as if there were on 700px, 
        allowing the rest of the HTML to move around. The device will not attempt to show the entire page and scale it 
        down-->
        <meta name="Viewport" content="width=device-width, initial-scale=1"> 
        
    	<!--CDNs-->
	<c:import url="WEB-INF/jspf/temp/edit-account/cdn-edit-account.jspf"></c:import>
	<!--end of CDN definitions-->
	
    </head>
    
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
        <div class="page" ng-app="mainApp">
            
	    <!--logo-header-->
            <c:import url="WEB-INF/jspf/common/logo-header-common.jspf"></c:import>
	    <!--end of logo header definitions-->
            
	    <!--Navigation bar-->
	    <%@include file="WEB-INF/jspf/patient/nav-main-PatientJSP.jspf" %>
	    <!--end of navigation bar definitions-->
	    
            <!--Messages coming from Servlet-->
	    <%@include file="WEB-INF/jspf/common/servlet-messages.jspf" %>
	    <!--end messages from servlet definitions-->
	    
            <div class="container">
                    
		<!--form for editing personal details-->
                <form class="form-horizontal" action="PatientInfo" method="POST" name="registrationForm">
    <table class="table table-hover">
	<thead>
	    <tr><th><label class="control-label col-sm-2" for="txt">Personal details</label></th></tr>
	</thead>
	<tbody>
	    <tr><td>
		    <label for="fname">First Name:</label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
			<input id="firstName" type="text" class="form-control" name="firstName" value="${firstname}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="lname">Last Name: </label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
			<input id="lastName" type="text" class="form-control" name="lastName" value="${lastname}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="birth">Date of Birth:</label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-gift"></span></span>
			<input type="text" id="datepicker" class="form-control" name="dateOfBirth" value="${date}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="add">Address:</label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
			<input id="address" type="text" class="form-control" name="address" value="${address}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="phone">Home Phone:</label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
			<input id="homephone" type="text" class="form-control" name="homePhone" value="${homephone}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="phone">Cell Phone:</label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
			<input id="cellphone" type="text" class="form-control" name="cellPhone" value="${cellphone}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="email">Email:</label> 
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
			<input type="email" class="form-control" name="email" required value="${email}">
		    </div>

	    </td></tr>
	    <tr><td>
		    <label for="contract">Contract Period:</label>
		    <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			<input type="text" class="form-control" name="contract" value="${contract}">
		    </div>
	    </td></tr>
	    <tr><td>
		    <label for="gender">Gender:</label> 
		    <div class="input-group">
			<%
			    String gender;
			    if((request.getAttribute("gender"))== null)
			       gender = "";
			    else
				gender = (String)request.getAttribute("gender");
			    if(gender.equals("M"))
			    {
				out.print("<input type='radio' name='gender' value='M' checked> Male&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
				out.print("<input type='radio' name='gender' value='F' > Female");
			    }
			    else if(gender.equals("F"))
			    {
				out.print("<input type='radio' name='gender' value='M' > Male&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
				out.print("<input type='radio' name='gender' value='F' checked> Female");
			    }
			    else
			    {
				out.print("<input type='radio' name='gender' value='M' > Male&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
				out.print("<input type='radio' name='gender' value='F' > Female");
			    }
			    %>
		    </div>
	    </td></tr>
	</tbody>
    </table>

    <div class="btn-group-vertical">
	<a id="white" href="SecurityServlet" class="btn btn-warning btn-lg" role="button" >Edit Security Question</a><br/>
	<a id="white" href="#" class="btn btn-warning btn-lg" role="button">Edit Bank information</a><br/>
    </div>
    <br/>
    <div class="control-label col-sm-1"><a id="white" href="index.jsp" class="btn btn-success" role="button">Cancel</a> </div>
    <div class="control-label col-sm-3"><input class="btn btn-success" type="submit" name="editProfile" value="Save"> </div>
    <br/><br/>
</form> 
		<%--c:import url="WEB-INF/jspf/temp/edit-account/form-personal-details.jspf"></c:import--%>
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

	    <!--not sure why this code for message scriptlet is here-->
	    <%@include file="WEB-INF/jspf/temp/edit-account/raw.jspf" %>
            
        </div>
    </body>
</html>