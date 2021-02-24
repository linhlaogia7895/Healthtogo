/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import beans.main.AdvertsBean;
import common.HtmlPageHelper;
import domains.main.CareersDomain;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Document   : AdvertsCareerStaffSideServlet.java
 * Version    : March 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for receiving inputs for career interface on the staff side
 */
public class AdvertsCareerStaffSideServlet extends HttpServlet {

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
	HttpSession session=request.getSession(true);
	
	String message="";
	
	/*Checks if logged in first*/
	String userName=(String)session.getAttribute("userName");
	if(!isNotNullOrEmpty(userName)){

	    message="You have to be logged in to add a career into the database";
	}
	
	/*Add new career*/
	String careerNewFormSubmit=request.getParameter("careerNewFormSubmit");
	if(isNotNullOrEmpty(careerNewFormSubmit) && isNotNullOrEmpty(userName)){
	    String POSITION_TITLE=request.getParameter("POSITION_TITLE");
	    String POSITION_CATEGORY=request.getParameter("POSITION_CATEGORY");
	    String EMPLOYMENT_TYPE=request.getParameter("EMPLOYMENT_TYPE");
	    String DATE_POSTED=request.getParameter("DATE_POSTED");
	    String DATE_CLOSED=request.getParameter("DATE_CLOSED");
	    String REQUIREMENTS=request.getParameter("REQUIREMENTS");
	    
	    /*converts date to sql format*/
	    java.util.Date datePosted=new java.util.Date(DATE_POSTED);
	    java.util.Date dateClosed=new java.util.Date(DATE_CLOSED);
	    Date sqlDatePosted=new Date(datePosted.getTime());
	    Date sqlDateClosed=new Date(dateClosed.getTime());
	    
	    CareersDomain cd=CareersDomain.newData(POSITION_TITLE, 
						    POSITION_CATEGORY, 
						    EMPLOYMENT_TYPE, 
						    sqlDatePosted, 
						    sqlDateClosed, 
						    REQUIREMENTS);
	    
	    if(validateData(cd)){
		
		AdvertsBean ab=new AdvertsBean();
		ab.addCareer(userName, 
			cd.getPOSITION_TITLE(), 
			cd.getPOSITION_CATEGORY(), 
			cd.getEMPLOYMENT_TYPE(), 
			cd.getDATE_CLOSED(), 
			cd.getREQUIREMENTS());
		cd.flush();
		
		message="Career data saved";
	    }
	}
	    
	
	/*Edit existing career*/
	String careerStaffEditFormSubmit=request.getParameter("careerStaffEditFormSubmit");
	if(isNotNullOrEmpty(careerStaffEditFormSubmit) && isNotNullOrEmpty(userName)){
	    String CAREER_ID=request.getParameter("CAREER_ID");
	    String POSITION_TITLE=request.getParameter("POSITION_TITLE");
	    String POSITION_CATEGORY=request.getParameter("POSITION_CATEGORY");
	    String EMPLOYMENT_TYPE=request.getParameter("EMPLOYMENT_TYPE");
	    String DATE_POSTED=request.getParameter("DATE_POSTED");
	    String DATE_CLOSED=request.getParameter("DATE_CLOSED");
	    String REQUIREMENTS=request.getParameter("REQUIREMENTS");
	    
	    /*converts date to sql format*/
	    java.util.Date datePosted=new java.util.Date(DATE_POSTED);
	    java.util.Date dateClosed=new java.util.Date(DATE_CLOSED);
	    Date sqlDatePosted=new Date(datePosted.getTime());
	    Date sqlDateClosed=new Date(dateClosed.getTime());
	    
	    CareersDomain cd=CareersDomain.getInstance(Integer.parseInt(CAREER_ID),
						    POSITION_TITLE, 
						    POSITION_CATEGORY, 
						    EMPLOYMENT_TYPE, 
						    sqlDatePosted, 
						    sqlDateClosed, 
						    REQUIREMENTS);
	    
	    if(validateData(cd) && isNotNullOrEmpty(CAREER_ID)){
		AdvertsBean ab=new AdvertsBean();
		
		/*saves edited data back to database*/
		if(ab.editCareer(userName,
			cd.getCAREER_ID(),
			cd.getPOSITION_TITLE(), 
			cd.getPOSITION_CATEGORY(), 
			cd.getEMPLOYMENT_TYPE(), 
			cd.getDATE_POSTED(),
			cd.getDATE_CLOSED(), 
			cd.getREQUIREMENTS())){
		    
		    message="Career data saved";
		    cd.flush();
		}
	    }
	}
	
	
	/*Delete existing career*/
	String delete=request.getParameter("delete");
	if(isNotNullOrEmpty(delete) && isNotNullOrEmpty(userName)){
	    String id=request.getParameter("id");
	    if(isNotNullOrEmpty(id)){
		AdvertsBean ab=new AdvertsBean();
		
		if(ab.removeCareer(userName, Integer.parseInt(id))){
		    message="Record deleted";
		}
	    }else{
		message="The ID of the record to be deleted is null or empty. Operation cancelled.";
	    }
	}
	
	request.setAttribute("message", HtmlPageHelper.getInstance().sendMessage(message));
	request.setAttribute("tableSelector", "career");
	getServletContext().getRequestDispatcher("/manage-adverts.jsp").forward(request, response);
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
    
        /**
     * Method to check if data within correct lengths
     * @param fc the FoodCaloriesDomain object
     * @return true if all data are within the correct lengths
     */
    private boolean validateData(CareersDomain cd){
	boolean correctLengths=false;
	boolean notNullOrEmpty=false;
	
	correctLengths= cd.getPOSITION_TITLE().length() < 31
			&& cd.getPOSITION_CATEGORY().length() < 31
			&& cd.getEMPLOYMENT_TYPE().length() < 31;
	
	notNullOrEmpty=	isNotNullOrEmpty(cd.getPOSITION_TITLE())
			&& isNotNullOrEmpty(cd.getPOSITION_CATEGORY())
			&& isNotNullOrEmpty(cd.getEMPLOYMENT_TYPE())
			&& isNotNullOrEmpty(cd.getDATE_POSTED())
			&& isNotNullOrEmpty(cd.getDATE_CLOSED())
			&& isNotNullOrEmpty(cd.getREQUIREMENTS());
	
	return correctLengths && notNullOrEmpty;
    }
}
