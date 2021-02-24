<% String file = request.getParameter("file"); 
file += ".pdf";%>
<embed src="pdfFile/<%=file%>" width="100%" height="100%" type='application/pdf'>