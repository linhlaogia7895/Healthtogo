package beans.users;

import domains.users.Account;
import domains.users.SecurityQuestion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.util.List;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;

/**
 * Document   : UsersBean.java
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Bean for users
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
@Singleton
public class UsersBean implements UsersBeanLocal {
    
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
     * Method to check if username and password entered exist in dabatase
     * @param userName the registered username
     * @param password the registered password
     * @return true is both credentials entered exist
     */
    @Lock(LockType.READ)
    @Override
    public final boolean userValidate(String userName, String password) {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
        boolean validateUser=false;
        try {

            conn = getConnection();
	    String sql="{call userValidate(?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, userName);
	    ps.setString(2, password);
	    rs = ps.executeQuery();
	    rs.next();
	    validateUser=rs.getInt(1)>0;

        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        return validateUser;
    }

    /**
     * Method to return the type of user that's logged in
     * @param userName the name to use to look up the user-type
     * @return String the user-type found
     */
    @Lock(LockType.READ)
    @Override
    public final String userGetType(String userName) {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
        String userType = "";
        try {
            conn = getConnection();
	    String sql="{call userGetType(?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, userName);
	    rs = ps.executeQuery();
	    rs.next();
	    userType=rs.getString(1);

        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        return userType;
    }

    /**
     * Method to deactivate an account
     * @param activityUser the user activity
     * @param accountUsername the username for account
     * @return true if account has been deactivated
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean deactivateAccount(String activityUser, String accountUsername) {
	PreparedStatement ps = null;
	Connection conn = null;
	
        boolean deactivated=false;
        
        try {
            
            conn = getConnection();
	    String sql="{call deactivateAccount(?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, activityUser);
	    ps.setString(2, accountUsername);
	    int updated=ps.executeUpdate();
	    deactivated=updated > 0;
                
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return deactivated;
    }

    
    /**
     * Method to create patient account by staff, nutritionist or admin
     * @param activityUser
     * @param newUsername
     * @param newPassword
     * @param newUserType
     * @param newLocked
     * @param newFirstName
     * @param newLastName
     * @param newEmail
     * @param newAddress
     * @param newHomePhone
     * @param newCellPhone
     * @param dateOfBirth
     * @param newGender
     * @param contractPeriod
     * @return true when the account has been created
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean createPatientAccountByOthers(
            String activityUser, 
            String newUsername, 
            String newPassword, 
            String newUserType, 
            boolean newLocked, 
            String newFirstName, String newLastName, 
            String newEmail, 
            String newAddress, 
            int newHomePhone, 
            int newCellPhone, 
            Date dateOfBirth, 
            char newGender, 
            String contractPeriod) 
    {
	Connection conn = null;
	PreparedStatement ps = null;
	
        boolean created=false;
        
        try {
            conn = getConnection();
	    String sql="{call createPatientAccountByOthers(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, activityUser);
	    ps.setString(2, newUsername);
	    ps.setString(3, newPassword);
	    ps.setString(4, newUserType);
	    ps.setBoolean(5, newLocked);
	    ps.setString(6, newFirstName);
	    ps.setString(7, newLastName);
	    ps.setString(8, newEmail);
	    ps.setString(9, newAddress);
	    ps.setInt(10, newHomePhone);
	    ps.setInt(11, newCellPhone);
	    ps.setDate(12, dateOfBirth); 
	    ps.setString(13, String.valueOf(newGender)); // Hi Linh. Pls check this. there's no ps.setChar() to set the value to SQL (newGender CHAR)
	    ps.setString(14, contractPeriod);
	    int updateResult=ps.executeUpdate();
	    created=updateResult>0;
                
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        return created;
    }

    @Lock(LockType.WRITE)
    @Override
    public final boolean accountSetUserType(String activityUser, String accountUsername, String accountUserType) {
	
	Connection conn = null;
	PreparedStatement ps = null;
	
        boolean typeSet=false;
        
        try {
            
            conn = getConnection();
	    String sql="{call accountSetUserType(?,?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, activityUser);
	    ps.setString(2, accountUsername);
	    ps.setString(3, accountUserType);
	    int result=ps.executeUpdate();
	    typeSet=result>0;
            
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return typeSet;
    }

    
    /**
     * Method to reactivate account
     * @param activityUser the activity user
     * @param accountUsername the account username
     * @return true when account reactivated
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean reactivateAccount(String activityUser, String accountUsername) {
        
	Connection conn = null;
	PreparedStatement ps = null;
	boolean reactivated=false;
        
        try {
            
            conn = getConnection();
	    String sql="{call accountUsername(?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, activityUser);
	    ps.setString(2, accountUsername);
	    int result=ps.executeUpdate();
	    reactivated=result>0;
            
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return reactivated;
    }

    
    /**
     * Method to add user
     * @param activityUser the activity user
     * @param newUsername the user username
     * @param newPassword the user password
     * @param newType the user type
     * @param newLocked the user lock status
     * @return true when user added
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean userAdd(String activityUser, String newUsername, String newPassword, String newType, boolean newLocked) 
    {
	Connection conn = null;
	PreparedStatement ps = null;
	
        boolean added=false;
        
        try {
            
            conn = getConnection();
	    String sql = "{call userAdd(?,?,?,?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, activityUser);
	    ps.setString(2, newUsername);
	    ps.setString(3, newPassword);
	    ps.setString(4, newType);
	    ps.setBoolean(5, newLocked);
	    ps.executeQuery();
	    added=true;
            
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return added;
    }

    /**
     * Method to return the account details
     * @param username the account's username that will be used to pull up account
     * @return Account the account details
     */
    @Lock(LockType.READ)
    @Override
    public final boolean userExists(String username) {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	    
        boolean ac = false;
        
        try {

            conn = getConnection();
	    String sql="{call userExists(?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, username);
	    rs = ps.executeQuery();
	    rs.next();
	    int count = rs.getInt(1);
	    if (count >0)
		ac=true;

        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return ac;
    }

    
    /**
     * Method to verify if username exists in the DBase before resetting password
     * @param username the account username
     * @return integer 1 if account exists
     */
    @Lock(LockType.WRITE)
    @Override
    public final int userForgetPassword(String username) {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
        int count=0;
        
        try {
            
            conn = getConnection();
	    String sql="{call userForgetPassword(?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, username);
	    rs = ps.executeQuery();
	    rs.next();
	    count=rs.getInt(1);
                    
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return count;
    }

    
    /**
     * Method to return the locked status of an account
     * @param username the account username
     * @return integer 1 if locked locked or 0 if unlocked
     */
    @Lock(LockType.READ)
    @Override
    public final int userGetLockedStatus(String username) {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
        int lockStatus=0;
        
        try {

            conn = getConnection();
	    String sql="{call userGetLockedStatus(?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, username);
	    rs = ps.executeQuery();
	    rs.next();
	    lockStatus=rs.getInt(1);
                
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return lockStatus;
    }

    
    /**
     * Method to return all matching security details
     * @param username the account username
     * @return ArrayList the list of matched security details
     */
    @Lock(LockType.READ)
    @Override
    public final ArrayList<SecurityQuestion> getSecurityQuestion(String username) {
        
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	ArrayList<SecurityQuestion> qList = new ArrayList<>();
        
        try {
            
            conn = getConnection();
	    String sql="{call getSecurityQuestion(?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, username);
	    rs = ps.executeQuery();
	    while(rs.next()){
		qList.add(SecurityQuestion.getInstance(rs.getString(1),rs.getString(2)));
	    }

        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        return qList;
    }

    
    /**
     * Method to reset password
     * @param activityUser the activity user
     * @param resetUsername the account username
     * @return true if password has been reset
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean userResetPassword(String activityUser, String resetUsername) {
        
	Connection conn = null;
	PreparedStatement ps = null;
	
	boolean isReset=false;
        
        try {

	    conn = getConnection();
	    String sql="{call userResetPassword(?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, activityUser);
	    ps.setString(2, resetUsername);
	    int result=ps.executeUpdate();
	    isReset=result > 0;
		
        } catch (SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
        
        return isReset;
    }
    
}
