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
 * Document   : AdvertsInternClientSideServlet.java
 * Version    : March 4, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for receiving inputs for intern interface
 */
public class AdvertsInternClientSideServlet extends HttpServlet {

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
	String detail_internApplyFormSubmit=request.getParameter("detail_internApplyFormSubmit");
	if(detail_internApplyFormSubmit!=null){
	    HttpSession session=request.getSession(true);
	    
	    
	    String detail_internID=request.getParameter("detail_internID");
	    String detail_internTitle=request.getParameter("detail_internTitle");
	    String detail_internCategory=request.getParameter("detail_internCategory");
	    String detail_internType=request.getParameter("detail_internType");
	    String detail_internDatePosted=request.getParameter("detail_internDatePosted");
	    String detail_internDateClosed=request.getParameter("detail_internDateClosed");
	    String detail_InternRequirements=request.getParameter("detail_InternRequirements");
	    
	    String detail_internFName=request.getParameter("detail_internFName");
	    String detail_internLName=request.getParameter("detail_internLName");
	    String detail_internEmail=request.getParameter("detail_internEmail");
	    String detail_internContactNum=request.getParameter("detail_internContactNum");
	    
	    String detail_internCoverLetter=request.getParameter("detail_internCoverLetter");
	    
	    String root=File.listRoots()[0].getAbsolutePath(); /*determines the root drive letter, ex. C:*/
	    String uploadFilePath = "HTGWebApplications/uploads/intern/";
	    String fileName=(String)session.getAttribute("uploadedFile");
	    
	    File f=new File(root+uploadFilePath+fileName);
	    boolean fileExists=f.exists();
	    if(fileExists) System.out.println("File exists in the path: "+f.getAbsolutePath());
	    
	    boolean dataComplete=detail_internID!=null && !detail_internID.isEmpty()
				&& detail_internTitle!=null && !detail_internTitle.isEmpty()
				&& detail_internCategory!=null && !detail_internCategory.isEmpty()
				&& detail_internType!=null && !detail_internType.isEmpty()
				&& detail_internDatePosted!=null && !detail_internDatePosted.isEmpty()
				&& detail_internDateClosed!=null && !detail_internDateClosed.isEmpty()
				&& detail_InternRequirements!=null && !detail_InternRequirements.isEmpty()
				&& detail_internFName!=null && !detail_internFName.isEmpty()
				&& detail_internLName!=null && !detail_internLName.isEmpty()
				&& detail_internEmail!=null && !detail_internEmail.isEmpty()
				&& detail_internContactNum!=null && !detail_internContactNum.isEmpty()
				&& detail_internCoverLetter!=null && !detail_internCoverLetter.isEmpty()
				&& fileExists;
	    
	    /*for testing*/
	    System.out.println("detail_internID: "+detail_internID);
	    System.out.println("careerTitle: "+detail_internTitle);
	    System.out.println("careerCategory: "+detail_internCategory);
	    System.out.println("careerType: "+detail_internType);
	    System.out.println("detail_internDatePosted: "+detail_internDatePosted);
	    System.out.println("detail_internDateClosed: "+detail_internDateClosed);
	    System.out.println("detail_InternRequirements: "+detail_InternRequirements);
	    System.out.println();
	    System.out.println("detail_internFName: "+detail_internFName);
	    System.out.println("detail_internLName: "+detail_internLName);
	    System.out.println("detail_internEmail: "+detail_internEmail);
	    System.out.println("detail_internContactNum: "+detail_internContactNum);
	    System.out.println("detail_internCoverLetter: "+detail_internCoverLetter);
	    
	    if(dataComplete)	message = "Application submitted";
	    else		message = "Application incomplete. All data will be discarded. You will have to start over again.";
	}
	
	request.setAttribute("message", HtmlPageHelper.getInstance().sendMessage(message));
	request.setAttribute("tableSelector", "intern");
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
