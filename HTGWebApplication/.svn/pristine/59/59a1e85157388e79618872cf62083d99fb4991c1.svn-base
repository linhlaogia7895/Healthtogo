/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.patient;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * Document   : PatientInfoDomain.java
 * Version    : April 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for patient info bean
 */
public final class PatientInfoDomain {
    private  int PATIENT_ID;
    private  String FIRST_NAME;
    private  String LAST_NAME;
    private  String EMAIL;
    private  String ADDRESS;
    private  String HOME_PHONE;
    private  String CELL_PHONE;
    private  Date DATE_OF_BIRTH;
    private  char GENDER;
    private  String CONTRACT;
    private  String USER_TYPE;
    private  int PACKAGE_ID;
    private  String ACCOUNT_STATUS;
    private SimpleDateFormat dt = new SimpleDateFormat("MM/DD/YYYY");
    /**
     * default constructor
     * @param PATIENT_ID
     * @param FIRST_NAME
     * @param LAST_NAME
     * @param EMAIL
     * @param ADDRESS
     * @param HOME_PHONE
     * @param CELL_PHONE
     * @param DATE_OF_BIRTH
     * @param GENDER
     * @param CONTRACT
     * @param USER_TYPE
     * @param PACKAGE_ID
     * @param ACCOUNT_STATUS 
     */
    private PatientInfoDomain(int PATIENT_ID, 
				String FIRST_NAME, 
				String LAST_NAME, 
				String EMAIL, 
				String ADDRESS, 
				String HOME_PHONE, 
				String CELL_PHONE, 
				Date DATE_OF_BIRTH, 
				char GENDER, 
				String CONTRACT, 
				String USER_TYPE, 
				int PACKAGE_ID, 
				String ACCOUNT_STATUS) {
	
	this.PATIENT_ID = PATIENT_ID;
	this.FIRST_NAME = FIRST_NAME;
	this.LAST_NAME = LAST_NAME;
	this.EMAIL = EMAIL;
	this.ADDRESS = ADDRESS;
	this.HOME_PHONE = HOME_PHONE;
	this.CELL_PHONE = CELL_PHONE;
	this.DATE_OF_BIRTH = DATE_OF_BIRTH;
	this.GENDER = GENDER;
	this.CONTRACT = CONTRACT;
	this.USER_TYPE = USER_TYPE;
	this.PACKAGE_ID = PACKAGE_ID;
	this.ACCOUNT_STATUS = ACCOUNT_STATUS;
    }


    
    private static PatientInfoDomain obj=null;
    /**
     * Instance method to create an object
     * @param PATIENT_ID
     * @param FIRST_NAME
     * @param LAST_NAME
     * @param EMAIL
     * @param ADDRESS
     * @param HOME_PHONE
     * @param CELL_PHONE
     * @param DATE_OF_BIRTH
     * @param GENDER
     * @param CONTRACT
     * @param USER_TYPE
     * @param PACKAGE_ID
     * @param ACCOUNT_STATUS
     * @return 
     */
    public static synchronized PatientInfoDomain getInstance(int PATIENT_ID, 
							    String FIRST_NAME, 
							    String LAST_NAME, 
							    String EMAIL, 
							    String ADDRESS, 
							    String HOME_PHONE, 
							    String CELL_PHONE, 
							    Date DATE_OF_BIRTH, 
							    char GENDER, 
							    String CONTRACT, 
							    String USER_TYPE, 
							    int PACKAGE_ID, 
							    String ACCOUNT_STATUS){
        
	
	    obj=new PatientInfoDomain(PATIENT_ID, 
				    FIRST_NAME, 
				    LAST_NAME, 
				    EMAIL, 
				    ADDRESS, 
				    HOME_PHONE, 
				    CELL_PHONE, 
				    DATE_OF_BIRTH, 
				    GENDER, 
				    CONTRACT, 
				    USER_TYPE, 
				    PACKAGE_ID, 
				    ACCOUNT_STATUS);
	    return obj;
	
    }
    
    /**
     * Method to get the pATIENT_ID
     * @return the pATIENT_ID
     */
    public synchronized final int getPATIENT_ID() {
	    return PATIENT_ID;
    }
    /**
     * Method to get the fIRST_NAME
     * @return the fIRST_NAME
     */
    public synchronized final String getFIRST_NAME() {
	    return FIRST_NAME;
    }
    /**
     * Method to get the lAST_NAME
     * @return the lAST_NAME
     */
    public synchronized final String getLAST_NAME() {
	    return LAST_NAME;
    }
    /**
     * Method to get the eMAIL
     * @return the eMAIL
     */
    public synchronized final String getEMAIL() {
	    return EMAIL;
    }
    /**
     * Method to get the aDDRESS
     * @return the aDDRESS
     */
    public synchronized final String getADDRESS() {
	    return ADDRESS;
    }
    /**
     * Method to get the hOME_PHONE
     * @return the hOME_PHONE
     */
    public synchronized final String getHOME_PHONE() {
	    return HOME_PHONE;
    }
    /**
     * Method to get the cELL_PHONE
     * @return the cELL_PHONE
     */
    public synchronized final String getCELL_PHONE() {
	    return CELL_PHONE;
    }
    /**
     * Method to get the dATE_OF_BIRTH
     * @return the dATE_OF_BIRTH
     */
    public synchronized final String getDATE_OF_BIRTH() {
        
	    return DATE_OF_BIRTH != null?dt.format(DATE_OF_BIRTH):"";
    }
    /**
     * Method to get the gENDER
     * @return the gENDER
     */
    public synchronized final char getGENDER() {
	    return GENDER;
    }
    /**
     * Method to get the cONTRACT
     * @return the cONTRACT
     */
    public synchronized final String getCONTRACT() {
	    return CONTRACT;
    }
    /**
     * Method to get the uSER_TYPE
     * @return the uSER_TYPE
     */
    public synchronized final String getUSER_TYPE() {
	    return USER_TYPE;
    }
    /**
     * Method to get the pACKAGE_ID
     * @return the pACKAGE_ID
     */
    public synchronized final int getPACKAGE_ID() {
	    return PACKAGE_ID;
    }
    /**
     * Method to get the aCCOUNT_STATUS
     * @return the aCCOUNT_STATUS
     */
    public synchronized final String getACCOUNT_STATUS() {
	    return ACCOUNT_STATUS;
    }
}
