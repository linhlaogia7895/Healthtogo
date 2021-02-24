/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.staff;


import beans.users.UsersBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Document   : ManagePatientByStaffBean.java
 * Version    : Jan 20, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: EJB for manage patient by staff
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
@Singleton
public class ManagePatientByStaffBean implements ManagePatientByStaffBeanLocal 
{

    /**
     * Method to edit patient account by staff
     * @param activityUser the registered user name
     * @param patientId the patient ID
     * @param newFirstName the new first name
     * @param newLastName the new last name
     * @param newEmail the email
     * @param newAddress the new address
     * @param newHomePhone the new home phone
     * @param newCellPhone the new cell phone
     * @param newDateOfBirth the new date of birth
     * @param newGender the new gender
     * @param newContractPeriod the contract period
     * @return true if the patient account is edited
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean editPatientAccountByStaff(
            String activityUser, 
            int patientId, 
            String newFirstName, 
            String newLastName, 
            String newEmail, 
            String newAddress, 
            String newHomePhone, 
            String newCellPhone, 
            Date newDateOfBirth, 
            String newGender, 
            String newContractPeriod) 
    {
         boolean patientAccountEdited = false;
        
         try {
            
            PreparedStatement ps;
            try (Connection conn = getConnection()) {
                String sql="{call editPatientAccountByOther(?,?,?,?,?,?,?,?,?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1, activityUser);
                ps.setInt(2, patientId);
                ps.setString(3,newFirstName);
                ps.setString(4, newLastName);
                ps.setString(5, newEmail);
                ps.setString(6, newAddress);
                ps.setString(7, newHomePhone);
                ps.setString(8, newCellPhone);
                ps.setDate(9, newDateOfBirth);
                ps.setString(10, newGender);
                ps.setString(11, newContractPeriod);
                ps.executeUpdate();
                patientAccountEdited = true;
                
                conn.close();
            }
            
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePatientByStaffBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return patientAccountEdited;
    }

    /**
     * Method to deactivate a patient account by staff
     * @param activityUser the registered user name
     * @param patientId the patient ID
     * @return true if the account has been deactivated
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean deactivatePatientAccountByStaff(String activityUser, int patientId) {
        
        boolean accountDeactivated = false;
        
         try {
            
            PreparedStatement ps;
            try (Connection conn = getConnection()) {
                String sql="{call deactivatePatientAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1, activityUser);
                ps.setInt(2, patientId);
                ps.executeQuery();
                accountDeactivated = true;
                
                conn.close();
            }
            
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePatientByStaffBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return accountDeactivated;
    }

    /**
     * Method to delete patient account by staff
     * @param activityUser the registered user name
     * @param patientId the patient ID
     * @return true if the patient account has been deleted
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean deletePatientAccountByStaff(String activityUser, int patientId) {
        
         boolean accountDeleted = false;
        
         try {
            
            PreparedStatement ps;
            try (Connection conn = getConnection()) {
                String sql="{call deleteAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1, activityUser);
                ps.setInt(2, patientId);
                ps.executeQuery();
                accountDeleted = true;
                
                conn.close();
            }
            
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePatientByStaffBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return accountDeleted;
    }

    /**
     * Method to reactivate patient account by staff
     * @param activityUser the registered user name
     * @param patientId the patient ID
     * @return true if the account is reactivated
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean reactivatePatientAccountByStaff(String activityUser, int patientId) {
        
         boolean accountReactivated = false;
        
         try {
            
            PreparedStatement ps;
            try (Connection conn = getConnection()) {
                String sql="{call reactivatePatientAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1, activityUser);
                ps.setInt(2, patientId);
                ps.executeQuery();
                accountReactivated = true;
                
                conn.close();
            }
            
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePatientByStaffBean.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return accountReactivated;
    }

    /**
     * Method to create an instance of the connection to the MYSQL DBase
     * @return Connection the connection to the DBAse
     */
     private Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            InitialContext ic=new InitialContext();
            DataSource ds=(DataSource)ic.lookup("jdbc/htgConnectionPool");
            conn=ds.getConnection();
        } catch (ClassNotFoundException | NamingException | SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
}
