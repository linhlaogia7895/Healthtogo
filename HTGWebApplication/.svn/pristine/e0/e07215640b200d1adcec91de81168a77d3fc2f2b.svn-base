/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import beans.main.NutritionLibraryBean;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import common.CreateSecurityHelper;
import common.HtmlPageHelper;
import domains.main.FoodCaloriesDomain;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Document   : CalorieTableServlet.js
 * Version    : Feb 2, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for managing the contents of calorie table
 */
public final class CalorieTableServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected final void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	try {
	    CreateSecurityHelper csh=CreateSecurityHelper.getInstance();
	    NutritionLibraryBean nlb=new NutritionLibraryBean();
	    
	    String url="/manage-nutrition-library.jsp";
	    String message="";
	    
	    /*a logged in activity user is required to use this functionality.
	    This must be checked here*/
	    String activityUser=(String)request.getSession().getAttribute("userName");
	    if(activityUser==null || activityUser.isEmpty()){
		message="Error: You have to be logged in as an authorized to use that functionality";
		request.getSession(false);
		request.getSession().invalidate();
		request.setAttribute("message", message);
		getServletContext().getRequestDispatcher("/index.jsp#main-page").forward(request, response);
		return;
	    }
	    
	    /*Add calorie*/
	    String add=request.getParameter("add");
	    if(add!=null){
		String foodName=request.getParameter("foodName");
		String recommendedCalories=request.getParameter("recommendedCalories");
		String calories=request.getParameter("calories");
		String protein=request.getParameter("protein");
		String fat=request.getParameter("fat");
		String carbs=request.getParameter("carbs");
		String fiber=request.getParameter("fiber");
		
		boolean isLoggedIn=activityUser!=null && !activityUser.isEmpty();
		if(isLoggedIn){
		    FoodCaloriesDomain fc=FoodCaloriesDomain.newData(foodName, 
								    Double.parseDouble(recommendedCalories), 
								    Double.parseDouble(calories),
								    Double.parseDouble(protein),
								    Double.parseDouble(fat),
								    Double.parseDouble(carbs),
								    Double.parseDouble(fiber));
		    boolean validated=validateData(fc);
		    if(validated && nlb.addCalorie(activityUser,
				    fc.getFOOD_NAME(),
				    fc.getRECOMMENDED_CALORIES(),
				    fc.getCALORIES(),
				    fc.getPROTEIN(),
				    fc.getFAT(),
				    fc.getCARBS(),
				    fc.getFIBER()
		    )){
			
			message="Calorie added";
		    }else{
			
			message="Error: Failed to add calorie. Please check your data";
		    }
		}else{
		    
		    message="Error: Either the food name is blank or you're not logged in";
		}
	    }
	    
	    
	    /*Edit calorie*/
	    String edit=request.getParameter("edit");
	    if(edit!=null && edit.equals("true")){
		
		/*Using GSON to parse data from http*/
		Gson gson=new Gson();
		FoodCaloriesDomain fc=gson.fromJson(request.getParameter("data"), FoodCaloriesDomain.class);
		boolean validated=validateData(fc);
		
		if(activityUser!=null && !activityUser.isEmpty()){
		    
		    if(validated && isNotNullOrEmpty(fc.getFOOD_ID()) 
				    && nlb.editCalorieTable(activityUser,
					fc.getFOOD_ID(),
					fc.getFOOD_NAME(),
					fc.getRECOMMENDED_CALORIES(),
					fc.getCALORIES(),
					fc.getPROTEIN(),
					fc.getFAT(),
					fc.getCARBS(),
					fc.getFIBER()
		    )){
			
			message="Calorie edited";
		    }else{
			
			message="Error: Failed to edit calorie. Please check your data";
		    }
		}else{
		    
		    message="Error: You have to be logged in as an authorized user to edit calorie";
		}
	    }
	    
	    /*Remove calorie*/
	    String remove=request.getParameter("remove");
	    if(remove!=null && remove.equals("true")){
		
		String id=request.getParameter("data");
		
		if(isNotNullOrEmpty(activityUser)&& isNotNullOrEmpty(id)){
		    
		    if(nlb.removeCalorie(activityUser,
			    Integer.parseInt(id))){
			
			message="Calorie removed";
		    }else{
			message="Error: Failed to remove calorie. Please check your data";
		    }
		}else{
		    message="Error: You have to be logged in as an authorized user to remove calorie";
		}
	    }
	    
	    HtmlPageHelper hph=HtmlPageHelper.getInstance();
	    if(!message.isEmpty())  request.setAttribute("message", hph.sendMessage(message));
	    getServletContext().getRequestDispatcher(url).forward(request, response);
	    
	} catch (Exception ex) {
	    Logger.getLogger(CalorieTableServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    protected final void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected final void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public final String getServletInfo() {
	return "Short description";
    }// </editor-fold>
    
    /**
     * Method to check if data within correct lengths
     * @param fc the FoodCaloriesDomain object
     * @return true if all data are within the correct lengths
     */
    private boolean validateData(FoodCaloriesDomain fc){
	boolean correctLengths=false;
	boolean notNullOrEmpty=false;
	
	correctLengths= fc.getFOOD_NAME().length() < 50
			&& fc.getRECOMMENDED_CALORIES() < 1000 
			&& fc.getCALORIES() < 1000 
			&& fc.getPROTEIN() < 1000
			&& fc.getFAT() < 1000
			&& fc.getCARBS() < 1000
			&& fc.getFIBER() < 1000;
	
	notNullOrEmpty=	isNotNullOrEmpty(fc.getFOOD_NAME()) 
			&& isNotNullOrEmpty(fc.getRECOMMENDED_CALORIES())
			&& isNotNullOrEmpty(fc.getCALORIES())
			&& isNotNullOrEmpty(fc.getPROTEIN())
			&& isNotNullOrEmpty(fc.getFAT())
			&& isNotNullOrEmpty(fc.getCARBS())
			&& isNotNullOrEmpty(fc.getFIBER());
	
	return correctLengths && notNullOrEmpty;
    }
    
    /**
     * Method to check if object is null or empty
     * @param o the Object
     * @return true if object is neither null or empty
     */
    private boolean isNotNullOrEmpty(Object o){
	return o!=null && !String.valueOf(o).isEmpty();
    }
}
