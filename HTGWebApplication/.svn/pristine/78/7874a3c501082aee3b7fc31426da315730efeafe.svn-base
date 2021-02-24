/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import beans.staff.StaffersBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 690727
 */
@WebServlet(name="SearchPatientByStaff", urlPatterns={"/SearchPatientByStaff"})
public class SearchPatientByStaff extends HttpServlet {

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
        
        String submitUpdatePatient = request.getParameter("submitUpdatePatient");
        String submitDeactivatePatient = request.getParameter("submitDeactivatePatient");
        String submitReactivatePatient = request.getParameter("submitReactivatePatient");
        String submitDeletePatient = request.getParameter("submitDeletePatient");
        
        StaffersBean pbean = new StaffersBean();
        String result = "";
        
        if(submitUpdatePatient != null)
        {

            String patientUpdateFirstName = request.getParameter("patientUpdatefirstName");
            String patientUpdateLastName = request.getParameter("patientUpdatelastName");
            String patientUpdatePhoneNumber = request.getParameter("patientUpdatePhoneNumber");

            if(patientUpdateFirstName == null)
            {
                patientUpdateFirstName = "";
            }
            if(patientUpdateLastName == null)
            {
                patientUpdateLastName = "";
            }
            if(patientUpdatePhoneNumber == null)
            {
                patientUpdatePhoneNumber = "";
            }
            
            result = pbean.searchPatientToUpdateByAdmin(patientUpdateFirstName, patientUpdateLastName, patientUpdatePhoneNumber);
            request.setAttribute("message", result);
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
                
        }
        if(submitDeactivatePatient != null)
        {
            String patientDeactivateFirstName = request.getParameter("patientDeactivatefirstName");
            String patientDeactivateLastName = request.getParameter("patientDeactivatelastName");
            String patientDeactivatePhoneNumber = request.getParameter("patientDeactivatePhoneNumber");
            
            if(patientDeactivateFirstName == null)
            {
                patientDeactivateFirstName = "";
            }
            if(patientDeactivateLastName == null)
            {
                patientDeactivateLastName = "";
            }
            if(patientDeactivatePhoneNumber == null)
            {
                patientDeactivatePhoneNumber = "";
            }
            
                result = pbean.searchPatientToDeactivateByAdmin(patientDeactivateFirstName, patientDeactivateLastName, patientDeactivatePhoneNumber);
           
               request.setAttribute("message", result);
               request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
        if(submitReactivatePatient != null)
        {
             String patientReactivateFirstName = request.getParameter("patientReactivatefirstName");
            String patientReactivateLastName = request.getParameter("patientReactivatelastName");
            String patientReactivatePhoneNumber = request.getParameter("patientReactivatePhoneNumber");
            
            if(patientReactivateFirstName == null)
            {
                patientReactivateFirstName = "";
            }
            if(patientReactivateLastName == null)
            {
                patientReactivateLastName = "";
            }
            if(patientReactivatePhoneNumber == null)
            {
                patientReactivatePhoneNumber = "";
            }
            
                result = pbean.searchPatientToReactviateByAdmin(patientReactivateFirstName, patientReactivateLastName, patientReactivatePhoneNumber);
            
               request.setAttribute("message", result);
               request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
        
        if(submitDeletePatient != null)
        {
            
            String patientDeleteFirstName = request.getParameter("patientDeletefirstName");
            String patientDeleteLastName = request.getParameter("patientDeletelastName");
            String patientDeletePhoneNumber = request.getParameter("patientDeletePhoneNumber");
            
            if(patientDeleteFirstName == null)
            {
                patientDeleteFirstName = "";
            }
            if(patientDeleteLastName == null)
            {
                patientDeleteLastName = "";
            }
            if(patientDeletePhoneNumber == null)
            {
                patientDeletePhoneNumber = "";
            }
                   
              result = pbean.searchPatientToDeleteByAdmin(patientDeleteFirstName, patientDeleteLastName, patientDeletePhoneNumber);
               request.setAttribute("message", result);
               request.getRequestDispatcher("/admin.jsp").forward(request, response);
            
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
