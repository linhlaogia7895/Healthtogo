/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import common.HtmlPageHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Document   : AdvertsVolunteerClientSideServlet.java
 * Version    : March 4, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for receiving inputs for volunteer interface
 */
public class AdvertsVolunteerClientSideServlet extends HttpServlet {

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
	
	String message="";
	String detail_volunteerApplyFormSubmit=request.getParameter("detail_volunteerApplyFormSubmit");
	if(detail_volunteerApplyFormSubmit!=null){
	    HttpSession session=request.getSession(true);
	    
	    
	    String detail_volunteerID=request.getParameter("detail_volunteerID");
	    String detail_volunteerTitle=request.getParameter("detail_volunteerTitle");
	    String detail_volunteerCategory=request.getParameter("detail_volunteerCategory");
	    String detail_volunteerType=request.getParameter("detail_volunteerType");
	    String detail_volunteerDatePosted=request.getParameter("detail_volunteerDatePosted");
	    String detail_volunteerDateClosed=request.getParameter("detail_volunteerDateClosed");
	    String detail_volunteerRequirements=request.getParameter("detail_volunteerRequirements");
	    
	    String detail_volunteerFName=request.getParameter("detail_volunteerFName");
	    String detail_volunteerLName=request.getParameter("detail_volunteerLName");
	    String detail_volunteerEmail=request.getParameter("detail_volunteerEmail");
	    String detail_volunteerContactNum=request.getParameter("detail_volunteerContactNum");
	    
	    String detail_volunteerCoverLetter=request.getParameter("detail_volunteerCoverLetter");
	    
	    String root=File.listRoots()[0].getAbsolutePath(); /*determines the root drive letter, ex. C:*/
	    String uploadFilePath = "HTGWebApplications/uploads/volunteer/";
	    String fileName=(String)session.getAttribute("uploadedFile");
	    
	    File f=new File(root+uploadFilePath+fileName);
	    boolean fileExists=f.exists();
	    if(fileExists) System.out.println("File exists in the path: "+f.getAbsolutePath());
	    
	    boolean dataComplete=detail_volunteerID!=null && !detail_volunteerID.isEmpty()
				&& detail_volunteerTitle!=null && !detail_volunteerTitle.isEmpty()
				&& detail_volunteerCategory!=null && !detail_volunteerCategory.isEmpty()
				&& detail_volunteerType!=null && !detail_volunteerType.isEmpty()
				&& detail_volunteerDatePosted!=null && !detail_volunteerDatePosted.isEmpty()
				&& detail_volunteerDateClosed!=null && !detail_volunteerDateClosed.isEmpty()
				&& detail_volunteerRequirements!=null && !detail_volunteerRequirements.isEmpty()
				&& detail_volunteerFName!=null && !detail_volunteerFName.isEmpty()
				&& detail_volunteerLName!=null && !detail_volunteerLName.isEmpty()
				&& detail_volunteerEmail!=null && !detail_volunteerEmail.isEmpty()
				&& detail_volunteerContactNum!=null && !detail_volunteerContactNum.isEmpty()
				&& detail_volunteerCoverLetter!=null && !detail_volunteerCoverLetter.isEmpty()
				&& fileExists;
	    
	    /*for testing*/
	    System.out.println("detail_volunteerID: "+detail_volunteerID);
	    System.out.println("careerTitle: "+detail_volunteerTitle);
	    System.out.println("careerCategory: "+detail_volunteerCategory);
	    System.out.println("careerType: "+detail_volunteerType);
	    System.out.println("detail_volunteerDatePosted: "+detail_volunteerDatePosted);
	    System.out.println("detail_volunteerDateClosed: "+detail_volunteerDateClosed);
	    System.out.println("detail_volunteerRequirements: "+detail_volunteerRequirements);
	    System.out.println();
	    System.out.println("detail_volunteerFName: "+detail_volunteerFName);
	    System.out.println("detail_volunteerLName: "+detail_volunteerLName);
	    System.out.println("detail_volunteerEmail: "+detail_volunteerEmail);
	    System.out.println("detail_volunteerContactNum: "+detail_volunteerContactNum);
	    System.out.println("detail_volunteerCoverLetter: "+detail_volunteerCoverLetter);
	    
	    if(dataComplete)	message = "Application submitted";
	    else		message = "Application incomplete. All data will be discarded. You will have to start over again.";
	}
	
	request.setAttribute("message", HtmlPageHelper.getInstance().sendMessage(message));
	request.setAttribute("tableSelector", "volunteer");
	getServletContext().getRequestDispatcher("/adverts-all.jsp").forward(request, response);
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
