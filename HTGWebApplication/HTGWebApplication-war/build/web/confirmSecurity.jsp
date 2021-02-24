<%-- 
    Document   : confirmSecurity.jsp
    Created on : Jan 26, 2017, 7:33:49 PM
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: JSP for confirming security questions
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
	<c:import url="WEB-INF/jspf/admin/confirm-security/cdn-confirm-security.jspf"></c:import>
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

            
            <div class="container">
		
		<!--form for confirming security questions-->
                <form class="form-horizontal" action="PatientInfo" method="POST">
    <table class="table table-hover">
	<thead>
	    <tr><th><label class="control-label col-sm-2" for="txt">Confirm Security Questions</label></th></tr>
	</thead>
	<tbody>
	    <tr><td>
		    <div class="input-group">
			<span class="input-group-addon">Question 1: &nbsp;</span>
			<input id="questionOne" type="text" class="form-control" name="questionOne" value="${questionOne}" disabled>
		    </div>
		    <div class="input-group">
			<span class="input-group-addon">Answer 1: &nbsp;&nbsp;&nbsp;&nbsp;</span>
			<input id="anwserOne" type="text" class="form-control" name="anwserOne">
		    </div>
	    </td></tr>
	    <tr><td>
		    <div class="input-group">
			<span class="input-group-addon">Question 2: &nbsp;</span>
			<input id="questionTwo" type="text" class="form-control" name="questionTwo" value="${questionTwo}" disabled>
		    </div>
		    <div class="input-group">
			<span class="input-group-addon">Anwser 2: &nbsp;&nbsp;&nbsp;&nbsp;</span>
			<input id="anwserTwo" type="text" class="form-control" name="anwserTwo">
		    </div>
	    </td></tr>
	</tbody>
    </table>
			<span id="messageText">${messageError}</span>
    <br/>
    <div class="control-label col-sm-1"><a id="white" href="PatientInformation" class="btn btn-success" role="button">Cancel</a> </div>
    <div class="control-label col-sm-3"><input class="btn btn-success" type="submit" name="submitAnwser" value="Submit"> </div>
    <br/><br/>
</form> 
		<%--c:import url="WEB-INF/jspf/admin/confirm-security/form-confirm-security-question.jspf"></c:import--%>
		<!--end form definitions-->

		<br/>
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