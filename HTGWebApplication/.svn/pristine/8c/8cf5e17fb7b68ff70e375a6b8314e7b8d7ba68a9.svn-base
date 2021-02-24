package beans.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import javax.ejb.Local;
import domains.users.Account;
import java.util.ArrayList;

/**
 * Document   : UsersBeanLocal.java
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: interface for UsersBean.java
 */
@Local
public interface UsersBeanLocal {
    boolean userValidate(String userName, String password);
    
    String userGetType(String userName);
    
    boolean deactivateAccount(String activityUser, String accountUsername);
    
    boolean createPatientAccountByOthers(
            String activityUser,
            String newUsername,
            String newPassword,
            String newUserType,
            boolean newLocked,
            String newFirstName,
            String newLastName,
            String newEmail,
            String newAddress,
            int newHomePhone,
            int newCellPhone,
            Date dateOfBirth,
            char newGender,
            String contractPeriod
    );
    
    boolean accountSetUserType(String activityUser, String accountUsername, String accountUserType);
    
    boolean reactivateAccount(String activityUser, String accountUsername);
    
    boolean userAdd(String activityUser, String newUsername, String newPassword, String newType, boolean newLocked);
    
    boolean userExists(String username);
    
    int userForgetPassword(String username);
    
    int userGetLockedStatus(String username);
    
    ArrayList getSecurityQuestion(String username);
    
    boolean userResetPassword(String activityUser, String resetUsername);
    
}
