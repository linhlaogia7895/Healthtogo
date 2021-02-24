/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.patient;

import domains.main.AppointmentsDomain;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 * Document   : PatientAppointmentsBean.java
 * Version    : April 4, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Bean for all patient appointments
 */
@Local
public interface PatientAppointmentsLocal {
    ArrayList getAllAppointments();
    AppointmentsDomain getAppointmentById(int appointmentID);
    ArrayList getAppointmentsByDate(Date date);
    boolean addAppointment(String activityUser, 
				    int patientId, 
				    int nutritionId, 
				    java.sql.Timestamp startDate, 
//				    Date startDate, 
				    Time startTime, 
				    java.sql.Timestamp endDate, 
//				    Date endDate, 
				    Time endTime, 
				    String appointmentType, 
				    String thePurpose);
    boolean editAppointmentById(String activityUser,
			    int appointmentId,
			    int patientId,
			    int nutritionId,
			    Date startDate,
			    Time startTime,
			    Date endDate,
			    Time endTime,
			    String appointmentType,
			    String thePurpose);
    boolean removeAppointmentById(String activityUser,
			    int appointmentId);
    int getPatientId(String username);
}
