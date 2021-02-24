/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import beans.staff.StaffersBean;
import common.HtmlPageHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 696645
 */
public class AddNewInvoice extends HttpServlet {

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
        HtmlPageHelper hph=new HtmlPageHelper();
        StaffersBean sb = new StaffersBean();
        String username = request.getParameter("userName");
        String submitNewInvoice = request.getParameter("submitNewInvoice");
        if(submitNewInvoice != null)
        {
            String patientId = request.getParameter("patientId");
            String subTotal = request.getParameter("subTotal");
            String taxRate = request.getParameter("taxRate");
            String taxAmount = request.getParameter("taxAmount");
            String totalAmount = request.getParameter("totalAmount");
            String address = request.getParameter("address");
            String description = request.getParameter("description");
            try {
                if(sb.createNewInvoice(username, patientId, subTotal, taxRate, taxAmount, totalAmount, address, description))
                {
                    request.setAttribute("message", hph.sendMessage("New Invoice Added"));
                    getServletContext().getRequestDispatcher("/invoice.jsp").forward(request, response);
                }
                else
                {
                    request.setAttribute("message", hph.sendMessage("An error happened, please try again."));
                    getServletContext().getRequestDispatcher("/staff.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AddNewInvoice.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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
