/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

import java.sql.Date;
import java.sql.Time;

/**
 * Document   : AppointmentsDomain.java
 * Version    : April 5, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for appointments
 */
public final class AppointmentsDomain {
    private int APPOINTMENT_ID;
    private final int PATIENT_ID;
    private final int NUTRITION_ID;
    private final Date START_DATE;
    private final Time START_TIME;
    private final Date END_DATE;
    private final Time END_TIME;
    private final String TYPE;
    private final String PURPOSE;

    /**
     * private constructor for class using all attributes
     * @param APPOINTMENT_ID the auto-generated primary key for the table by which each record is identified
     * @param PATIENT_ID the patient ID
     * @param NUTRITION_ID the nutritionist ID
     * @param START_DATE the start date of the appointment
     * @param START_TIME the start time of the appointment
     * @param END_DATE the end date of the appointment
     * @param END_TIME the end time of the appointment
     * @param TYPE the type of consultation
     * @param PURPOSE the purpose of the consultation
     */
    private AppointmentsDomain(int APPOINTMENT_ID, 
				int PATIENT_ID, 
				int NUTRITION_ID, 
				Date START_DATE,
				Time START_TIME,
				Date END_DATE, 
				Time END_TIME,
				String TYPE, 
				String PURPOSE) {
	this.APPOINTMENT_ID = APPOINTMENT_ID;
	this.PATIENT_ID = PATIENT_ID;
	this.NUTRITION_ID = NUTRITION_ID;
	this.START_DATE = START_DATE;
	this.START_TIME= START_TIME;
	this.END_DATE = END_DATE;
	this.END_TIME=END_TIME;
	this.TYPE = TYPE;
	this.PURPOSE = PURPOSE;
    }

    /**
     * private constructor for class using all attributes
     * @param PATIENT_ID the patient ID
     * @param NUTRITION_ID the nutritionist ID
     * @param START_DATE the start date of the appointment
     * @param START_TIME the start time of the appointment
     * @param END_DATE the end date of the appointment
     * @param END_TIME the end time of the appointment
     * @param TYPE the type of consultation
     * @param PURPOSE the purpose of the consultation
     */
    public AppointmentsDomain(int PATIENT_ID, 
			    int NUTRITION_ID, 
			    Date START_DATE,
			    Time START_TIME,
			    Date END_DATE, 
			    Time END_TIME,
			    String TYPE, 
			    String PURPOSE) {
	this.PATIENT_ID = PATIENT_ID;
	this.NUTRITION_ID = NUTRITION_ID;
	this.START_DATE = START_DATE;
	this.START_TIME=START_TIME;
	this.END_DATE = END_DATE;
	this.END_TIME=END_TIME;
	this.TYPE = TYPE;
	this.PURPOSE = PURPOSE;
    }
    
    private static AppointmentsDomain obj=null;
    
    /**
     * Method to return an instance of the class that sets the final values to the class level attributes
     * @param APPOINTMENT_ID the auto-generated primary key for the table by which each record is identified
     * @param PATIENT_ID the patient ID
     * @param NUTRITION_ID the nutritionist ID
     * @param START_DATE the start date of the appointment
     * @param START_TIME the start time of the appointment
     * @param END_DATE the end date of the appointment
     * @param END_TIME the end time of the appointment
     * @param TYPE the type of consultation
     * @param PURPOSE the purpose of the consultation
     * @return AppointmentsDomain the instance of the class
     */
    public static AppointmentsDomain getInstance(int APPOINTMENT_ID, 
						int PATIENT_ID, 
						int NUTRITION_ID, 
						Date START_DATE, 
						Time START_TIME, 
						Date END_DATE, 
						Time END_TIME, 
						String TYPE, 
						String PURPOSE){
	if(obj==null){
	    obj=new AppointmentsDomain(APPOINTMENT_ID, 
					PATIENT_ID, 
					NUTRITION_ID, 
					START_DATE, 
					START_TIME, 
					END_DATE, 
					END_TIME, 
					TYPE, PURPOSE);
	    return obj;
	}else{
	    return obj;
	}
    }
    
    /**
     * Method to return an instance of class with new data
     * @param PATIENT_ID the patient ID
     * @param NUTRITION_ID the nutritionist ID
     * @param START_DATE the start date of the appointment
     * @param START_TIME the start time of the appointment
     * @param END_DATE the end date of the appointment
     * @param END_TIME the end time of the appointment
     * @param TYPE the type of consultation
     * @param PURPOSE the purpose of the consultation
     * @return AppointmentsDomain the instance of the class
     */
    public static AppointmentsDomain newData(int PATIENT_ID, 
	    int NUTRITION_ID, 
	    Date START_DATE, 
	    Time START_TIME, 
	    Date END_DATE, 
	    Time END_TIME, 
	    String TYPE, 
	    String PURPOSE){
	obj=null;
	obj=new AppointmentsDomain(PATIENT_ID, 
				NUTRITION_ID, 
				START_DATE, 
				START_TIME, 
				END_DATE, 
				END_TIME, 
				TYPE, 
				PURPOSE);
	return obj;
    }
    
    /**
     * Method to flush obj
     */
    public static synchronized void flush(){
	obj=null;
    }
    
    /**
     * Method to get the aPPOINTMENT_ID
     * @return the aPPOINTMENT_ID
     */
    public synchronized final int getAPPOINTMENT_ID() {
	    return APPOINTMENT_ID;
    }
    /**
     * Method to get the pATIENT_ID
     * @return the pATIENT_ID
     */
    public synchronized final int getPATIENT_ID() {
	    return PATIENT_ID;
    }
    /**
     * Method to get the nUTRITION_ID
     * @return the nUTRITION_ID
     */
    public synchronized final int getNUTRITION_ID() {
	    return NUTRITION_ID;
    }
    /**
     * Method to get the sTART_DATE
     * @return the sTART_DATE
     */
    public synchronized final Date getSTART_DATE() {
	    return START_DATE;
    }
    /**
     * Method to get the sTART_TIME
     * @return the sTART_TIME
     */
    public synchronized final Time getSTART_TIME() {
	    return START_TIME;
    }
    /**
     * Method to get the eND_DATE
     * @return the eND_DATE
     */
    public synchronized final Date getEND_DATE() {
	    return END_DATE;
    }
    /**
     * Method to get the eND_TIME
     * @return the eND_TIME
     */
    public synchronized final Time getEND_TIME() {
	    return END_TIME;
    }
    /**
     * Method to get the tYPE
     * @return the tYPE
     */
    public synchronized final String getTYPE() {
	    return TYPE;
    }
    /**
     * Method to get the pURPOSE
     * @return the pURPOSE
     */
    public synchronized final String getPURPOSE() {
	    return PURPOSE;
    }
}

