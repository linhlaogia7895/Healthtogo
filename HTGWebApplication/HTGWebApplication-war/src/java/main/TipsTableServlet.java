/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import beans.main.NutritionLibraryBean;
import com.google.gson.Gson;
import common.HtmlPageHelper;
import domains.main.FoodCaloriesDomain;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Document   : TipsTableServlet.js
 * Version    : Feb 5, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for tips table data
 */
public class TipsTableServlet extends HttpServlet {

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
	
	/*Add tips*/
	String add=request.getParameter("add");
	if(add!=null){
	    String foodName=request.getParameter("foodName");
	    String recommendedCalories=request.getParameter("recommendedCalories");
	    String calories=request.getParameter("calories");
	    String protein=request.getParameter("protein");
	    String fat=request.getParameter("fat");
	    String carbs=request.getParameter("carbs");
	    String fiber=request.getParameter("fiber");
	    
	    boolean hasFood=foodName!=null && !foodName.isEmpty() && activityUser!=null && !activityUser.isEmpty();
	    if(hasFood){
		if(nlb.addCalorie(activityUser,
			foodName, 
			Double.parseDouble(recommendedCalories),
			Double.parseDouble(calories),
			Double.parseDouble(protein),
			Double.parseDouble(fat),
			Double.parseDouble(carbs),
			Double.parseDouble(fiber))){
		    
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
	if(edit!=null){
	    
	    /*Using GSON to parse data from http*/
	    Gson gson=new Gson();
	    FoodCaloriesDomain fc=gson.fromJson(request.getParameter("data"), FoodCaloriesDomain.class);
	    
	    if(activityUser!=null && !activityUser.isEmpty() 
		    && String.valueOf(fc.getFOOD_ID())!=null && !String.valueOf(fc.getFOOD_ID()).isEmpty()){
		
	    if(nlb.editCalorieTable(activityUser,
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
	if(remove!=null){
	    
	    String id=request.getParameter("data");
	    
	    if(activityUser!=null && !activityUser.isEmpty() 
		    && id!=null && !id.isEmpty()){
		
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
