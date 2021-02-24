/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import beans.patient.PatientBean;
import beans.staff.ManagePatientByStaffBean;
import beans.staff.StaffersBean;
import common.HtmlPageHelper;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author 690727
 */
@WebServlet(name="ManagePatientByStaffServlet", urlPatterns={"/ManagePatientByStaffServlet"})
public class ManagePatientByStaffServlet extends HttpServlet {

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
         StaffersBean pbean = new StaffersBean();
         PatientBean pb =  new PatientBean();
         ManagePatientByStaffBean mpatient = new ManagePatientByStaffBean();
         
         String submitCreatePatient = request.getParameter("submitCreatePatient");
         
         if(submitCreatePatient != null)
         {
              String userName = (String) request.getSession().getAttribute("userName");
              String username = request.getParameter("username");
              String accountStatus = request.getParameter("accountStatus");
              String lockStatus = request.getParameter("lockStatus");
              String firstName = request.getParameter("firstName");
              String lastName = request.getParameter("lastName");
              String email = request.getParameter("email");
              String address = request.getParameter("address");
              String homePhone = request.getParameter("homePhone");
              String cellPhone = request.getParameter("cellPhone");
              String dateOfBirth = request.getParameter("dateOfBirth");
              String gender = request.getParameter("gender");
              String contractPeriod = request.getParameter("contract");
              String questionOne = request.getParameter("questionOne");
              String questionTwo = request.getParameter("questionTwo");
              String anwserOne = request.getParameter("anwserOne");
              String anwserTwo = request.getParameter("anwserTwo");
              SimpleDateFormat sdformat = new SimpleDateFormat("MM/DD/YYYY"); 
              
              try
              {
                  Date date = sdformat.parse(dateOfBirth);
                  java.sql.Date birthDate = new java.sql.Date(date.getTime());
                  boolean lockedStatus = Boolean.parseBoolean(lockStatus);
                  

                  if((pbean.createPatientAccountByStaff(userName, username,"patient", lockedStatus, firstName, lastName, email, address, homePhone, cellPhone, birthDate, gender ,contractPeriod ,accountStatus))
                                &&  (pb.addSecurityQuestion(username, username, questionOne, anwserOne, questionTwo, anwserTwo)))
             
                  {
                      request.setAttribute("message", hph.sendMessage("Patient account created successfully."));
                      getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
                  }
                  else
                  {
                      request.setAttribute("message", hph.sendMessage("Unable to create Patient account!!!"));
                      getServletContext().getRequestDispatcher("/createPatientAccountByStaff.jsp").forward(request, response);
                  }
            }
              catch (Exception ex) {
                Logger.getLogger(ManagePatientByStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
              
         }
         
         String submitEditPatient = request.getParameter("submitEditPatient");
         String submitCancelPatientUpdate = request.getParameter("submitCancelPatientUpdate");
         
         if(submitCancelPatientUpdate != null)
         {
             request.setAttribute("message", hph.sendMessage("Patient update canceled."));
             getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
         }
         
         if(submitEditPatient != null)
         {
             String activityUser =(String) request.getSession().getAttribute("userName");
             String patientId = request.getParameter("patientId");
             String firstName = request.getParameter("firstName");
             String lastName = request.getParameter("lastName");
             String email = request.getParameter("email");
             String dateOfBirth = request.getParameter("dateOfBirth");
             String address = request.getParameter("address");
             String homePhone = request.getParameter("homePhone");
             String cellPhone = request.getParameter("cellPhone");
             String gender = request.getParameter("gender");
             String contract = request.getParameter("contract");
             SimpleDateFormat sdformat = new SimpleDateFormat("MM/DD/YYYY");
             
             try
             {
                 Date date = sdformat.parse(dateOfBirth);
                 java.sql.Date birthDate = new java.sql.Date(date.getTime());
                 int patientID = Integer.parseInt(patientId);
                 
                 if(mpatient.editPatientAccountByStaff(activityUser, patientID, firstName, lastName, email, address, homePhone, cellPhone, birthDate, gender, contract))
                 {
                    request.setAttribute("message", hph.sendMessage("Patient profile updated!"));
                    getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
                 }
                 else
                 {
                     response.sendRedirect("EditPatientInfoByStaff?message=Unable to update patient information");
                 }
             }
             catch(Exception e)
             {
                 
             }
         }
         String deactivatePatientID = request.getParameter("deactivatePatientID");
         if(deactivatePatientID != null)
         {
             int deactivatePatientId = Integer.parseInt(deactivatePatientID);
             String activityUser =(String) request.getSession().getAttribute("userName");
             if(mpatient.deactivatePatientAccountByStaff(activityUser, deactivatePatientId))
             {
                    request.setAttribute("message", hph.sendMessage("Patient account deactivated!"));
                    getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
             }
             else
             {
                    request.setAttribute("message", hph.sendMessage("Unable to deactivate patient account!"));
                    getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
             }
         }
         String reactivatePatientID = request.getParameter("reactivatePatientID");
         if(reactivatePatientID != null)
         {
             int reactivatePatientId = Integer.parseInt(reactivatePatientID);
             String activityUser =(String) request.getSession().getAttribute("userName");
             if(mpatient.reactivatePatientAccountByStaff(activityUser, reactivatePatientId))
             {
                 request.setAttribute("message", hph.sendMessage("Patient account reactivated!"));
                 getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
             }
             else
             {
                    request.setAttribute("message", hph.sendMessage("Unable to reactivate patient account!"));
                    getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
             }
         }
         String deletePatientID = request.getParameter("deletePatientID");
         if(deletePatientID != null)
         {
             int deletePatientId = Integer.parseInt(deletePatientID);
             String activityUser = (String)request.getSession().getAttribute("userName");
             
             if(mpatient.deletePatientAccountByStaff(activityUser, deletePatientId))
             {
                 request.setAttribute("message", hph.sendMessage("Patient account deleted!"));
                 getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
             }
             else
             {
                 request.setAttribute("message", hph.sendMessage("Unable to delete patient account"));
                 getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
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
