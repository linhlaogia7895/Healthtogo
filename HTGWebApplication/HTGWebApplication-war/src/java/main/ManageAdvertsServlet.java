/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import common.CreateSecurityHelper;
import common.HtmlPageHelper;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Document   : ManageAdvertsServlet.java
 * Version    : Feb 15, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for managing the adverts
 */
public class ManageAdvertsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	String url="";
	
	/*Goto page*/
	String message=request.getParameter("message");
	String page=request.getParameter("page");
	String tableSelector=request.getParameter("tableSelector");
	
	if(page!=null && !page.isEmpty()){
	    String decryptedPage=CreateSecurityHelper.decrypt(page);
	    if(decryptedPage.equals("manageadverts"))
		url="/manage-adverts.jsp";
	    else if(decryptedPage.equals("adverts-all")){
		url="/adverts-all.jsp";
	    }
	    else{
		response.sendRedirect("PageNotFound");
		return;
	    }    
	}else{
	    response.sendRedirect("PageNotFound");
	    return;
	}
	

	String decryptedTableSelector=CreateSecurityHelper.decrypt(tableSelector);
	switch(decryptedTableSelector){
	    case "news":
		request.setAttribute("tableSelector", "news");
		break;
	    case "promos":
		request.setAttribute("tableSelector", "promos");
		break;
	    case "career":
		request.setAttribute("tableSelector", "career");
		break;
	    case "intern":
		request.setAttribute("tableSelector", "intern");
		break;
	    case "volunteer":
		request.setAttribute("tableSelector", "volunteer");
		break;
	    default:
		response.sendRedirect("PageNotFound");
		return;
	}
	    
	
	boolean hasPage=page!=null && !page.isEmpty() && tableSelector!=null &!tableSelector.isEmpty();
	if(hasPage){
	    if(message!=null) request.setAttribute("message", HtmlPageHelper.getInstance().sendMessage(message));
	    getServletContext().getRequestDispatcher(url).forward(request, response);
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}