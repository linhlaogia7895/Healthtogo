/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import beans.main.AdvertsBean;
import common.HtmlPageHelper;
import domains.main.ApplicationsDomain;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Document   : AdvertsCareerClientSideServlet.java
 * Version    : March 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for receiving inputs for career interface
 */
public class AdvertsCareerClientSideServlet extends HttpServlet {

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
	String detail_careerApplyFormSubmit=request.getParameter("detail_careerApplyFormSubmit");
	if(isNotNullOrEmpty(detail_careerApplyFormSubmit)){
	    HttpSession session=request.getSession(true);
	    
	    String userName=(String)session.getAttribute("userName");
	    String CAREER_ID=request.getParameter("CAREER_ID");
	    
	    String careerFName=request.getParameter("careerFName");
	    String careerLName=request.getParameter("careerLName");
	    String EMAIL=request.getParameter("EMAIL");
	    String CONTACT_NUMBER=request.getParameter("CONTACT_NUMBER");
	    String COVER_LETTER=request.getParameter("COVER_LETTER");
	    
	    /*determines the root drive letter, ex. C:*/
	    String root=File.listRoots()[0].getAbsolutePath(); 
	    
	    String uploadFilePath = "HTGWebApplications/uploads/career/";
	    String fileName=(String)session.getAttribute("uploadedFile");
	    
	    File f=new File(root+uploadFilePath+fileName);
	    boolean fileExists=f.exists();
	    if(fileExists) System.out.println("File exists in the path: "+f.getAbsolutePath());
	    
	    /*checks if logged in*/
	    if(isNotNullOrEmpty(userName)){
		boolean dataComplete=isNotNullOrEmpty(CAREER_ID)
				&& isNotNullOrEmpty(careerFName)
				&& isNotNullOrEmpty(careerLName)
				&& isNotNullOrEmpty(EMAIL)
				&& isNotNullOrEmpty(CONTACT_NUMBER)
				&& isNotNullOrEmpty(COVER_LETTER)
				&& fileExists;
	    
		/*checks if all data are in order*/
		if(dataComplete){
		    String NAME=careerFName+" "+careerLName;

		    /*Constructs ApplicationsDomain object*/
		    ApplicationsDomain ad=ApplicationsDomain.newData(Integer.parseInt(CAREER_ID), 0, 0, 
								    NAME, 
								    EMAIL, 
								    CONTACT_NUMBER, 
								    COVER_LETTER, 
								    f.getAbsolutePath());
		    /*validates length of data*/
		    if(validateLength(ad)){
			AdvertsBean ab=new AdvertsBean();

			/*Saves to database and check return boolean if successful*/
			boolean applicationAdded=ab.addApplication(userName,
								    ad.getCAREER_ID(),
								    ad.getINTERN_ID(),
								    ad.getVOLUNTEER_ID(),
								    ad.getNAME(),
								    ad.getEMAIL(),
								    ad.getCONTACT_NUMBER(),
								    ad.getCOVER_LETTER(),
								    ad.getRESUME_PATH());
			if(applicationAdded){
			    message = "Application submitted";	
			}else{
			    message = "Save unsuccessful. Problem occurred while saving data. Please check your data and resubmit.";	
			}

		    }else{
			message = "Incorrect length";
		    }
		}
		else{
		    message = "Application incomplete. All data will be discarded. You will have to start over again.";
		}
	    }else{
		message="You need to be logged in to submit an application";
	    }
	}
	
	if(isNotNullOrEmpty(message)) request.setAttribute("message", HtmlPageHelper.getInstance().sendMessage(message));
	request.setAttribute("tableSelector", "career");
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
    private boolean validateLength(ApplicationsDomain ad){
	boolean correctLengths=false;
	
	correctLengths= String.valueOf(ad.getCAREER_ID()).length() < 10
			&& ad.getNAME().length() < 31
			&& ad.getEMAIL().length() < 51
			&& ad.getCONTACT_NUMBER().length() < 12
			&& ad.getCOVER_LETTER().length() < 1000
			&& ad.getRESUME_PATH().length() < 101; 
	
	return correctLengths;
    }
}
