/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import beans.main.AdvertsBean;
import common.HtmlPageHelper;
import domains.main.InternsDomain;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Document   : AdvertsInternStaffSideServlet.java
 * Version    : March 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for managing the intern interface on the staff side
 */
public class AdvertsInternStaffSideServlet extends HttpServlet {

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
	
	/*Add new intern*/
	String newInternFormSubmit=request.getParameter("newInternFormSubmit");
	if(isNotNullOrEmpty(newInternFormSubmit) && isNotNullOrEmpty(userName)){
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
	    
	    InternsDomain id=InternsDomain.newData(POSITION_TITLE, 
						    POSITION_CATEGORY, 
						    EMPLOYMENT_TYPE, 
						    sqlDatePosted, 
						    sqlDateClosed, 
						    REQUIREMENTS);
	    
	    if(validateData(id)){
		AdvertsBean ab=new AdvertsBean();
		
		if(ab.addIntern(userName, 
			id.getPOSITION_TITLE(), 
			id.getPOSITION_CATEGORY(), 
			id.getEMPLOYMENT_TYPE(), 
			id.getDATE_CLOSED(), 
			id.getREQUIREMENTS())){
		    
		    id.flush();    
		    message="Career data saved";
		}else{
		    message="Error in saving data. Please check you input.";
		}
	    }else{
		message="Failed validation. Title, type and category cannot exceed 30 characters. And no field can be empty.";
	    }
	}
	
	
	/*Edit existing career*/
	String internEditFormSubmit=request.getParameter("internEditFormSubmit");
	if(isNotNullOrEmpty(internEditFormSubmit) && isNotNullOrEmpty(userName)){
	    String INTERN_ID=request.getParameter("INTERN_ID");
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
	    
	    InternsDomain cd=InternsDomain.getInstance(Integer.parseInt(INTERN_ID),
						    POSITION_TITLE, 
						    POSITION_CATEGORY, 
						    EMPLOYMENT_TYPE, 
						    sqlDatePosted, 
						    sqlDateClosed, 
						    REQUIREMENTS);
	    
	    if(validateData(cd) && isNotNullOrEmpty(INTERN_ID)){
		AdvertsBean ab=new AdvertsBean();
		
		
		/*saves edited data back to database*/
		if(ab.editIntern(userName,
			cd.getINTERN_ID(),
			cd.getPOSITION_TITLE(), 
			cd.getPOSITION_CATEGORY(), 
			cd.getEMPLOYMENT_TYPE(), 
			cd.getDATE_POSTED(),
			cd.getDATE_CLOSED(), 
			cd.getREQUIREMENTS())){
		    
		    message="Career data saved";
		    cd.flush();
		}else{
		    message="Error in saving data. Please check you input.";
		}
	    }else{
		message="Failed validation. Title, type and category cannot exceed 30 characters. And no field can be empty.";
	    }
	}
	
	
	/*Delete existing career*/
	String delete=request.getParameter("delete");
	if(isNotNullOrEmpty(delete) && isNotNullOrEmpty(userName)){
	    String id=request.getParameter("id");
	    if(isNotNullOrEmpty(id)){
		AdvertsBean ab=new AdvertsBean();
		
		if(ab.removeIntern(userName, Integer.parseInt(id))){
		    message="Record deleted";
		}
	    }else{
		message="The ID of the record to be deleted is null or empty. Operation cancelled.";
	    }
	}
	
	
	request.setAttribute("message", HtmlPageHelper.getInstance().sendMessage(message));
	request.setAttribute("tableSelector", "intern");
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
    private boolean validateData(InternsDomain id){
	boolean correctLengths=false;
	boolean notNullOrEmpty=false;
	
	correctLengths= id.getPOSITION_TITLE().length() < 31
			&& id.getPOSITION_CATEGORY().length() < 31
			&& id.getEMPLOYMENT_TYPE().length() < 31;
	
	notNullOrEmpty=	isNotNullOrEmpty(id.getPOSITION_TITLE())
			&& isNotNullOrEmpty(id.getPOSITION_CATEGORY())
			&& isNotNullOrEmpty(id.getEMPLOYMENT_TYPE())
			&& isNotNullOrEmpty(id.getDATE_POSTED())
			&& isNotNullOrEmpty(id.getDATE_CLOSED())
			&& isNotNullOrEmpty(id.getREQUIREMENTS());
	
	return correctLengths && notNullOrEmpty;
    }
}
