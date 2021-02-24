/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import beans.staff.EditPatientByStaffBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author 690727
 */
public class EditPatientInfoByStaff extends HttpServlet {

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
        //processRequest(request, response);
        int patientId = Integer.parseInt(request.getParameter("updatePatientID"));
        
        try
        {
            EditPatientByStaffBean pbean = new EditPatientByStaffBean(patientId);
            request.setAttribute("patientId", request.getParameter("updatePatientID"));
            request.setAttribute("firstName", pbean.getFirstName());
            request.setAttribute("lastName", pbean.getLastName());
            request.setAttribute("email", pbean.getEmail());
            request.setAttribute("address", pbean.getAddress());
            request.setAttribute("homePhone", pbean.getHomePhone());
            request.setAttribute("cellPhone", pbean.getCellPhone());
            request.setAttribute("dateOfBirth", pbean.getDateOfBirth());
            request.setAttribute("gender", pbean.getGender());
            request.setAttribute("contract", pbean.getContract());
            
            getServletContext().getRequestDispatcher("/updatePatientByStaff.jsp").forward(request, response);
            
        }
        catch(NamingException ex)
        {
            Logger.getLogger(EditPatientInfoByStaff.class.getName()).log(Level.SEVERE, null, ex);
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