package beans.admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import beans.users.UsersBean;
import java.sql.ResultSet;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;

/**
 * Document   : AdminBean.java
 * Version    : Jan 20, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: EJB for admin connections
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
@Singleton
public class AdminBean{

    
    /**
     * Private method to manage connections to jdbc
     * @return Connection the jdbc connection
     */
    @Lock(LockType.READ)
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
    

    /**
     * Method to edit account by admin
     * @param activityUser the activity user
     * @param newUsername the staff username
     * @param newFirstName the staff first name
     * @param newLastName the staff last name
     * @param newEmail the staff email
     * @param newAddress the staff physical address
     * @param newHomePhone the staff home phone
     * @param newCellPhone the staff cell phone
     * @param dateOfBirth the staff date of birth
     * @param newSalary the staff salary
     * @param newGender the staff gender
     * @param jobStatus the staff job status
     * @param accountStatus the staff account status
     * @return true when the staff account has been edited
     */
    @Lock(LockType.WRITE)
    public final boolean editStaffAccountByAdminOrNutritionist(
            String activityUser, 
            String staffId, 
            String newFirstName, 
            String newLastName, 
            String newEmail, 
            String newAddress, 
            String newHomePhone, 
            String newCellPhone, 
            Date dateOfBirth,
            double newSalary, 
            String newGender, 
            String jobStatus, 
            String accountStatus) 
            
    {
        boolean accountEdited=false;
        
	PreparedStatement ps=null;
	
        try {
            
            try (Connection conn = getConnection()) {
                String sql="{call editStaffAccountByAdminOrNutritionist(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1, activityUser);
                ps.setInt(2, Integer.parseInt(staffId));
                ps.setString(3, newFirstName);
                ps.setString(4, newLastName);
                ps.setString(5, newEmail);
                ps.setString(6, newAddress);
                ps.setString(7, newHomePhone);
                ps.setString(8, newCellPhone);
                ps.setDate(9, dateOfBirth);
                ps.setDouble(10, newSalary);
                ps.setString(11, newGender); // Hi Linh. Pls check this. there's no ps.setChar() to set the value to SQL (newGender CHAR)
                ps.setString(12, jobStatus);
                ps.setString(13, accountStatus);
                ps.executeUpdate();
                accountEdited= true;
                
                System.out.println(newFirstName);
                System.out.println(newLastName);
                System.out.println(accountStatus);
                conn.close();
            }
            
        
        } catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
                
        return accountEdited;
    }

    /**
     * Method to find staff to update by admin
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    @Lock(LockType.WRITE)
    public String findStaffToUpdateByAdmin(String firstName, String lastName, String phoneNumber) 
    {
        String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Update Staff Account</th></tr> </thead>";
        
	PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='UpdateStaffServlet?staffID="+rs.getInt(1) +"'>Update</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
		conn.close();
            }
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
             
    return resulttable;
    }

    /**
     * Method to find staff account to reset by admin
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    @Lock(LockType.WRITE)
    public final String findStaffToResetByAdmin(String firstName, String lastName, String phoneNumber) {
        
       String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Reset Password</th></tr> </thead>";
        
       PreparedStatement ps=null;
       
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='resetStaff.jsp?staffID="+rs.getInt(1) +"'>Reset Password</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
	   try {
	       ps.close();
	   } catch (SQLException ex) {
	       Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	   }
	}
             
    return resulttable;
    }

    /**
     * Method to find the staff to deactivate by admin
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    @Lock(LockType.WRITE)
    public String findStaffToDeactivateByAdmin(String firstName, String lastName, String phoneNumber) {
        
        String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Deactivate Staff Account</th></tr> </thead>";
        
	PreparedStatement ps=null;
	
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='DeactivateStaffServlet?deactivateStaffID="+rs.getInt(1) +"'>Deactivate</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
                 conn.close();
            }
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
             
    return resulttable;
    }

    /**
     * Method to find staff account to eactivate by admin
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    @Lock(LockType.WRITE)
    public String findStaffToReactviateByAdmin(String firstName, String lastName, String phoneNumber) {
        
        String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Reactivate Staff Account</th></tr> </thead>";
        PreparedStatement ps=null;
	
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='DeactivateStaffServlet?reactivateStaffID="+rs.getInt(1) +"'>Reactivate</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
             
    return resulttable;
    }

    /**
     * Method to find staff account to delete by admin
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    @Lock(LockType.WRITE)
    public String findStaffToDeleteByAdmin(String firstName, String lastName, String phoneNumber) {
        
       String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Delete Staff Account</th></tr> </thead>";
        
       PreparedStatement ps = null;
       
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='DeactivateStaffServlet?deleteStaffID="+rs.getInt(1) +"'>Delete</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	   try {
	       ps.close();
	   } catch (SQLException ex) {
	       Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	   }
	}
             
    return resulttable;
    }

    /**
     * Method to reset password by user and admin
     * @param activityUser the user name
     * @param staffID the staff ID
     * @param resetPassword the password to reset
     */
    @Lock(LockType.WRITE)
    public void resetPasswordByUserAndAdmin(String activityUser, int staffID, String resetPassword) {
        
	PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call resetPasswordById(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,activityUser);
                ps.setInt(2, staffID);
                ps.setString(3, resetPassword);
                ps.executeQuery();
                
                 conn.close();
            }
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
    }
    /**
     * Method to find the staff account to lock by admin
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    public String findStaffToLockByAdmin(String firstName, String lastName, String phoneNumber) {
       
         String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Lock Staff Account</th></tr> </thead>";
        
	 PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='DeactivateStaffServlet?lockStaffID="+rs.getInt(1) +"'>Lock Staff</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	     try {
		 ps.close();
	     } catch (SQLException ex) {
		 Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	     }
	}
             
    return resulttable;
    }

    /**
     * Method to find a locked staff account to unlock
     * @param firstName the registered first name
     * @param lastName the registered last name
     * @param phoneNumber the account phone number
     * @return String the constructed HTML string of the record found
     */
    public String findStaffToUnlockByAdmin(String firstName, String lastName, String phoneNumber) {
        
     String resulttable=" <table class=\"table table-striped\"><thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Home Phone</th><th>Cell Phone</th><th>Unlock Staff Account</th></tr> </thead>";
        
     PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call searchStaffInfo(?,?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,firstName);
                ps.setString(2, lastName);
                ps.setString(3, phoneNumber);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                     resulttable+=(" <tbody><tr>");
                     resulttable+=("<td>"+rs.getString(2) +"</td>");
                     resulttable+=("<td>" +rs.getString(3)+ "</td>");
                     resulttable+=("<td>" +rs.getString(4)+ "</td>");
                     resulttable+=("<td>" +rs.getString(5)+ "</td>");
                     resulttable+=("<td>" +rs.getString(6)+ "</td>");
                     resulttable+=("<td>" +rs.getString(7)+ "</td>");
                     resulttable+=("<td><a href='DeactivateStaffServlet?unlockStaffID="+rs.getInt(1) +"'>Unlock Staff</a></td>");
                     resulttable+=("</tr></tbody>"); 
                }
                
                resulttable+="</table>";
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
             
    return resulttable;
        
    }

    /**
     * Method to delete staff account by ID
     * @param activityUser the username
     * @param staffID the staff ID
     */
    public void deleteStaffAccountByID(String activityUser, int staffID) {
       
	PreparedStatement ps=null;
         try
        {
            
            try(Connection conn = getConnection())
            {
                String sql = "{call deleteAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,activityUser);
                ps.setInt(2, staffID);
                ps.executeQuery();
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	 }
    }
    
    /**
     * Method to deactivate staff account by admin
     * @param activityUser the username
     * @param staffID the staff ID
     */
    @Lock(LockType.WRITE)
    public void deactivateStaffByAdmin(String activityUser, int staffID) {
        
	PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call deactivateStaffAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,activityUser);
                ps.setInt(2, staffID);
                ps.executeQuery();
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
       
    }

    /**
     * Method to reactivate staff account by admin
     * @param activityUser the username
     * @param staffID the staff ID
     */
    public void reactivateStaffByAdmin(String activityUser, int staffID) {
        
	PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call reactivateStaffAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,activityUser);
                ps.setInt(2, staffID);
                ps.executeQuery();
                
               
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
    }

    /**
     * Method to lock staff account by admin
     * @param activityUser the username
     * @param staffID the staff ID
     */
    public void lockStaffByAdmin(String activityUser, int staffID) {
        
	PreparedStatement ps=null;
        try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call lockAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,activityUser);
                ps.setInt(2, staffID);
                ps.executeQuery();
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
    }

    /**
     * Method to unlock staff account by admin
     * @param activityUser the username
     * @param staffID the staff ID
     */
    public void unlockStaffByAdmin(String activityUser, int staffID) {
        
	PreparedStatement ps=null;
         try
        {
            try(Connection conn = getConnection())
            {
                String sql = "{call unlockAccountById(?,?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1,activityUser);
                ps.setInt(2, staffID);
                ps.executeQuery();
                
                 conn.close();
            }
            
        }
        
         catch (SQLException ex) {
            Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdminBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	 }
    }
}