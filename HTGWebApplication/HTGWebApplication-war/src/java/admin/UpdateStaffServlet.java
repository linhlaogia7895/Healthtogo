/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import beans.admin.AdminBean;
import beans.admin.UpdateStaffByAdminBean;
import common.HtmlPageHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 690727
 */
@WebServlet(name="UpdateStaffServlet", urlPatterns={"/UpdateStaffServlet"})
public class UpdateStaffServlet extends HttpServlet {

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
       
          int staffID = Integer.parseInt(request.getParameter("staffID"));
       // String userName = (String) request.getSession().getAttribute("userName");
       
        try
        {
           UpdateStaffByAdminBean  updateBean = new UpdateStaffByAdminBean(staffID);
            request.setAttribute("staffId", request.getParameter("staffID"));
            request.setAttribute("firstname",   updateBean.getFirstName());
            request.setAttribute("lastname",    updateBean.getLastName());
            request.setAttribute("dateOfBirth", updateBean.getDateOfBirth());
            request.setAttribute("address",     updateBean.getAddress());
            request.setAttribute("homePhone",   updateBean.getHomePhone());
            request.setAttribute("cellPhone",   updateBean.getCellPhone());
            request.setAttribute("email",       updateBean.getEmail());
            request.setAttribute("gender",      updateBean.getGender());
            request.setAttribute("dateOfHire",  updateBean.getDateOfHire());
          //  request.setAttribute("salary",      updateBean.getSalary());

          
            getServletContext().getRequestDispatcher("/updateStaffByAdminOrNutritionist.jsp").forward(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(ManageStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
       }
        
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
