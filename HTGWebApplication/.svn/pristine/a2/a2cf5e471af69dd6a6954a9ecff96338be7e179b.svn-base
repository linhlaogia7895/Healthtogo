/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.staff;

import java.sql.Date;
import javax.ejb.Local;

/**
 * Document: ManagePatientByStaffBeanLocal
 * Version: Jan 20 2017 
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Interface to define the methods for editing a staff account, deactivating a staff account
 * reactivating a staff account and deleting a staff account.
 * 
 */
@Local
public interface ManagePatientByStaffBeanLocal {
    
    boolean editPatientAccountByStaff(
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
        String newContractPeriod);
    
    boolean deactivatePatientAccountByStaff(String activityUser, int patientId);
    boolean deletePatientAccountByStaff(String activityUser, int patientId);
    boolean reactivatePatientAccountByStaff(String activityUser, int patientId);
    
}
