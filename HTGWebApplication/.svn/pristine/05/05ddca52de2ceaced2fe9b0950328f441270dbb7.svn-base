/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import beans.main.AdvertsBean;
import domains.main.CareersDomain;
import domains.main.InternsDomain;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Document   : DetailsCarrierServlet_CareerInternVolunteer.java
 * Version    : March 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for sending details of career, intern and volunteer to the details jsp page
 */
public class DetailsCarrierServlet_CareerInternVolunteer extends HttpServlet {

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
	
	/*career details*/
	String careerGetDetailsSubmit=request.getParameter("careerGetDetailsSubmit");
	if(careerGetDetailsSubmit!=null){
	    
	    String careerID=request.getParameter("CAREER_ID");
	    
	    boolean hasDetails=isNotNullOrEmpty(careerID);
	    if(hasDetails){
		AdvertsBean ab=new AdvertsBean();
		CareersDomain cd=ab.getCareerById(Integer.parseInt(careerID));
		
		request.setAttribute("CAREER_ID", cd.getCAREER_ID());
		request.setAttribute("POSITION_TITLE", cd.getPOSITION_TITLE());
		request.setAttribute("POSITION_CATEGORY", cd.getPOSITION_CATEGORY());
		request.setAttribute("EMPLOYMENT_TYPE", cd.getEMPLOYMENT_TYPE());
		request.setAttribute("DATE_POSTED", cd.getDATE_POSTED());
		request.setAttribute("DATE_CLOSED", cd.getDATE_CLOSED());
		request.setAttribute("REQUIREMENTS", cd.getREQUIREMENTS());
		
		cd.flush();
		
		request.setAttribute("tableSelector", "career");
	    }else{
		response.sendRedirect("ManageAdvertsServlet?page=adverts-all&tableSelector=career&message=Incomplete data");
	    }
	}
	
	/*intern details*/
	String internGetDetailsSubmit=request.getParameter("internGetDetailsSubmit");
	if(internGetDetailsSubmit!=null){
	    
	    String INTERN_ID=request.getParameter("INTERN_ID");
	    boolean hasDetails=isNotNullOrEmpty(INTERN_ID);
	    
	    if(hasDetails){
		AdvertsBean ab=new AdvertsBean();
		InternsDomain id=ab.getInternById(Integer.parseInt(INTERN_ID));
		
		request.setAttribute("INTERN_ID", id.getINTERN_ID());
		request.setAttribute("POSITION_TITLE", id.getPOSITION_TITLE());
		request.setAttribute("POSITION_CATEGORY", id.getPOSITION_CATEGORY());
		request.setAttribute("EMPLOYMENT_TYPE", id.getEMPLOYMENT_TYPE());
		request.setAttribute("DATE_POSTED", id.getDATE_POSTED());
		request.setAttribute("DATE_CLOSED", id.getDATE_CLOSED());
		request.setAttribute("REQUIREMENTS", id.getREQUIREMENTS());
		
		System.out.println("///// id: "+INTERN_ID);
		System.out.println("///// POSITION_TITLE: "+id.getPOSITION_TITLE());
		System.out.println("///// POSITION_CATEGORY: "+id.getPOSITION_CATEGORY());
		System.out.println("///// EMPLOYMENT_TYPE: "+id.getEMPLOYMENT_TYPE());
		System.out.println("///// DATE_POSTED: "+id.getDATE_POSTED());
		System.out.println("///// DATE_CLOSED: "+id.getDATE_CLOSED());
		System.out.println("///// REQUIREMENTS: "+id.getREQUIREMENTS());
		
		id.flush();
		request.setAttribute("tableSelector", "intern");
	    }else{
		response.sendRedirect("ManageAdvertsServlet?page=adverts-all&tableSelector=intern&message=Incomplete data");
	    }
	}
	    
	/*volunteer details*/
	String volunteerGetDetailsSubmit=request.getParameter("volunteerGetDetailsSubmit");
	if(volunteerGetDetailsSubmit!=null){
	    
	    String volunteerID=request.getParameter("volunteerID");
	    String volunteerTitle=request.getParameter("volunteerTitle");
	    String volunteerCategory=request.getParameter("volunteerCategory");
	    String volunteerEmploymentType=request.getParameter("volunteerEmploymentType");
	    String volunteerDatePosted=request.getParameter("volunteerDatePosted");
	    String volunteerDateClosed=request.getParameter("volunteerDateClosed");
	    String volunteerRequirements=request.getParameter("volunteerRequirements");
	    
	    boolean hasDetails=volunteerID!=null && !volunteerID.isEmpty()
			    && volunteerTitle!=null && !volunteerTitle.isEmpty()
			    && volunteerCategory!=null && !volunteerCategory.isEmpty()
			    && volunteerEmploymentType!=null && !volunteerEmploymentType.isEmpty()
			    && volunteerDatePosted!=null && !volunteerDatePosted.isEmpty()
			    && volunteerDateClosed!=null && !volunteerDateClosed.isEmpty()
			    && volunteerRequirements!=null && !volunteerRequirements.isEmpty();
	    if(hasDetails){
		
		System.out.println("has details:--------------> "+careerGetDetailsSubmit);
		System.out.println("volunteerID:::::: "+volunteerID);
		System.out.println("volunteerTitle:::::: "+volunteerTitle);
		System.out.println("volunteerCategory:::::: "+volunteerCategory);
		System.out.println("volunteerEmploymentType:::::: "+volunteerEmploymentType);
		System.out.println("volunteerDatePosted:::::: "+volunteerDatePosted);
		System.out.println("volunteerDateClosed:::::: "+volunteerDateClosed);
		System.out.println("volunteerRequirements:::::: "+volunteerRequirements);
		
		request.setAttribute("volunteerID", volunteerID);
		request.setAttribute("volunteerTitle", volunteerTitle);
		request.setAttribute("volunteerCategory", volunteerCategory);
		request.setAttribute("volunteerEmploymentType", volunteerEmploymentType);
		request.setAttribute("volunteerDatePosted", volunteerDatePosted);
		request.setAttribute("volunteerDateClosed", volunteerDateClosed);
		request.setAttribute("volunteerRequirements", volunteerRequirements);
		
		request.setAttribute("tableSelector", "volunteer");
	    }else{
		response.sendRedirect("ManageAdvertsServlet?page=adverts-all&tableSelector=volunteer&message=Incomplete data");
	    }
	}
	
	getServletContext().getRequestDispatcher("/position-details-page-CareerInternVolunteer.jsp").forward(request, response);
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

    
    /**
     * Method to check if object is null or empty
     * @param o the Object
     * @return true if object is neither null or empty
     */
    private boolean isNotNullOrEmpty(Object o){
	return o!=null && !String.valueOf(o).isEmpty();
    }
    
}
