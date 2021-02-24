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
 * Document   : NutritionLibrary.java
 * Version    : Jan 13, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for nutrition library
 */
public final class NutritionLibrary extends HttpServlet {

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
        HtmlPageHelper hph=new HtmlPageHelper();
        
        String url="/nutrition-library.jsp";
        
        String specialPath=request.getParameter("specialPath");
	String decryptedSpecialPath=CreateSecurityHelper.decrypt(specialPath);
	if(isNotNullNorEmpty(specialPath)){
	    if(decryptedSpecialPath.equals("nutrition-library")){
		url="/nutrition-library.jsp";

		String tableSelector=request.getParameter("tableSelector");
		String decryptedTableSelector=CreateSecurityHelper.decrypt(tableSelector);
		switch(decryptedTableSelector){
		    case "calorie":
			request.setAttribute("tableSelector", "calorie");
			break;
		    case "tt":
			request.setAttribute("tableSelector", "tips");
			break;
		    case "faa":
			request.setAttribute("tableSelector", "faq");
			break;
		    default:
			response.sendRedirect("PageNotFound");
			return;
		}
	    }else{
		response.sendRedirect("PageNotFound");
		return;
	    }
	}
	
        
        /*retrieves the session scoped usertype*/
        String userType = (String)request.getSession().getAttribute("userType");
        if(userType==null){
            
            /*shows sign-up and login elements on navbar*/
            hph.setNavBarElements("", request);
            
            /*makes the menu items under account restricted before login*/
            request.setAttribute("classRequireLogin", "class='require-login'");
            
        }else{
            
            /*sets up menu for staff, nutritionist, or admin. Patient is not included being a common menu*/
            hph.setNavBarElements(userType, request);
        }
        
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
     * Method to check if object is null or empty
     * @param o the Object
     * @return true if object is neither null or empty
     */
    private final boolean isNotNullNorEmpty(Object o){
	return o!=null && !String.valueOf(o).isEmpty();
    }
    
    /**
     * Method to check if object is null or empty
     * @param o the Object
     * @return true if object is neither null or empty
     */
    private final boolean isNullOrEmpty(Object o){
	return o==null || String.valueOf(o).isEmpty();
    }
}
