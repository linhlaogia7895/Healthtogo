/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.users;

import java.sql.Date;

/**
 * Document   : Journal.java
 * Version    : Jan 21, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for Journal
 */
public final class Journal {
    private  int JOURNAL_NUMBER;
    private  int PATIENT_ID;
    private  int RECORD_NUMBER;
    private  Date RECORD_DATE;
    private  Date DATE_COMPLETED;
    private  int DIET_PLAN_NUMBER;
    private  String MOTIVATION;
    private  String ACTIVITY_COMPLETED;
    private  double START_WEIGHT;
    private  double END_WEIGHT;



    /**
     * main constructor
     * @param journalNumber
     * @param patientId
     * @param recordNumber
     * @param dateRecord
     * @param dateCompleted
     * @param dietPlanNumber
     * @param motivation
     * @param activityCompleted
     * @param startWeight
     * @param endWeight 
     */
    private Journal(int journalNumber, 
		    int patientId, 
		    int recordNumber, 
		    Date dateRecord, 
		    Date dateCompleted, 
		    int dietPlanNumber, 
		    String motivation, 
		    String activityCompleted, 
		    double startWeight, 
		    double endWeight) {
	
        this.JOURNAL_NUMBER = journalNumber;
        this.PATIENT_ID = patientId;
        this.RECORD_NUMBER = recordNumber;
        this.RECORD_DATE = dateRecord;
        this.DATE_COMPLETED = dateCompleted;
        this.DIET_PLAN_NUMBER = dietPlanNumber;
        this.MOTIVATION = motivation;
        this.ACTIVITY_COMPLETED = activityCompleted;
        this.START_WEIGHT = startWeight;
        this.END_WEIGHT = endWeight;
    }
    
    private static Journal obj=null;
    /**
     * getInstance method to create object 
     * @param journalNumber
     * @param patientId
     * @param recordNumber
     * @param dateRecord
     * @param dateCompleted
     * @param dietPlanNumber
     * @param motivation
     * @param activityCompleted
     * @param startWeight
     * @param endWeight
     * @return 
     */
    public static synchronized Journal getInstance(int journalNumber, 
						int patientId, 
						int recordNumber, 
						Date dateRecord, 
						Date dateCompleted, 
						int dietPlanNumber, 
						String motivation, 
						String activityCompleted, 
						double startWeight, 
						double endWeight){
	
	    obj=new Journal(journalNumber, 
			    patientId, 
			    recordNumber, 
			    dateRecord, 
			    dateCompleted, 
			    dietPlanNumber, 
			    motivation, 
			    activityCompleted, 
			    startWeight, 
			    endWeight);
	    return obj;
    }

    /**
     * Method to get the jOURNAL_NUMBER
     * @return the jOURNAL_NUMBER
     */
    public synchronized final int getJOURNAL_NUMBER() {
	    return JOURNAL_NUMBER;
    }
    /**
     * Method to get the pATIENT_ID
     * @return the pATIENT_ID
     */
    public synchronized final int getPATIENT_ID() {
	    return PATIENT_ID;
    }
    /**
     * Method to get the rECORD_NUMBER
     * @return the rECORD_NUMBER
     */
    public synchronized final int getRECORD_NUMBER() {
	    return RECORD_NUMBER;
    }
    /**
     * Method to get the rECORD_DATE
     * @return the rECORD_DATE
     */
    public synchronized final Date getRECORD_DATE() {
	    return RECORD_DATE;
    }
    /**
     * Method to get the dATE_COMPLETED
     * @return the dATE_COMPLETED
     */
    public synchronized final Date getDATE_COMPLETED() {
	    return DATE_COMPLETED;
    }
    /**
     * Method to get the dIET_PLAN_NUMBER
     * @return the dIET_PLAN_NUMBER
     */
    public synchronized final int getDIET_PLAN_NUMBER() {
	    return DIET_PLAN_NUMBER;
    }
    /**
     * Method to get the mOTIVATION
     * @return the mOTIVATION
     */
    public synchronized final String getMOTIVATION() {
	    return MOTIVATION;
    }
    /**
     * Method to get the aCTIVITY_COMPLETED
     * @return the aCTIVITY_COMPLETED
     */
    public synchronized final String isACTIVITY_COMPLETED() {
	    return ACTIVITY_COMPLETED;
    }
    /**
     * Method to get the sTART_WEIGHT
     * @return the sTART_WEIGHT
     */
    public synchronized final double getSTART_WEIGHT() {
	    return START_WEIGHT;
    }
    /**
     * Method to get the eND_WEIGHT
     * @return the eND_WEIGHT
     */
    public synchronized final double getEND_WEIGHT() {
	    return END_WEIGHT;
    }
}
