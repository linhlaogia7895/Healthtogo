package beans.nutritionist;

import java.sql.Date;
import javax.ejb.Local;

/**
 * Document   : NutritionistBeanLocal.java
 * Version    : Jan 20, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: interface for NutritionistBean.java
 */
@Local
public interface NutritionistBeanLocal {
    boolean editStaffAccountByAdminOrNutritionist(
            String activityUser,
            String newUsername,
            String newFirstName,
            String newLastName,
            String newEmail,
            String newAddress,
            int newHomePhone,
            int newCellPhone,
            Date dateOfBirth,
            double newSalary,
            char newGender,
            String jobStatus,
            String accountStatus
    );
}
