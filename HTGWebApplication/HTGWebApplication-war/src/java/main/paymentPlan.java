package main;

import common.HtmlPageHelper;
import java.io.IOException;
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
public final class paymentPlan extends HttpServlet {

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
        boolean hasSpecialPath=specialPath!=null;
        if(hasSpecialPath){
            url="/"+specialPath+".jsp";
            String tableSelector=request.getParameter("tableSelector");
            request.setAttribute("tableSelector", tableSelector);
	    
	    System.out.println("url: "+url);
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

}
