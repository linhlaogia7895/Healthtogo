/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

import java.sql.Date;

/**
 * Document   : FoodCaloriesDomain.java
 * Version    : Feb 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for jdbc Nutrition calorie table
 */
public final class PatientDomain {
    private int PATIENT_ID;
    private  String FIRSTNAME;
    private  String LASTNAME;
    private  Date DATEOFBIRTH;
    private  String EMAIL;
    private  String HOMEPHONE;
    private  String CELLPHONE;
    private  String ADDRESS;

    /**
     * private constructor for FoodCaloriesDomain
     * @param id the food ID
     * @param firstname the food name
     * @param lastname the recommended dateOfBirth
     * @param dateOfBirth the dateOfBirth equivalent
     * @param email the email equivalent
     * @param homePhone the homePhone equivalent
     * @param cellPhone the cellPhone equivalent
     * @param address the address equivalent
     */
    private PatientDomain(int id, 
			String firstname, 
			String lastname, 
			Date dateOfBirth, 
			String email, 
			String homePhone, 
			String cellPhone, 
			String address) {
	this.PATIENT_ID = id;
	this.FIRSTNAME = firstname;
	this.LASTNAME = lastname;
	this.DATEOFBIRTH = dateOfBirth;
	this.EMAIL = email;
	this.HOMEPHONE = homePhone;
	this.CELLPHONE = cellPhone;
	this.ADDRESS = address;
    }
    
        private PatientDomain(String firstname, 
			String lastname, 
			Date dateOfBirth, 
			String email, 
			String homePhone, 
			String cellPhone, 
			String address) {
	this.FIRSTNAME = firstname;
	this.LASTNAME = lastname;
	this.DATEOFBIRTH = dateOfBirth;
	this.EMAIL = email;
	this.HOMEPHONE = homePhone;
	this.CELLPHONE = cellPhone;
	this.ADDRESS = address;
    }
    
    private static PatientDomain obj=null;
    
    /**
     * Method to return an instance of the class
     * @param id the food ID
     * @param firstname the food name
     * @param lastname the recommended dateOfBirth
     * @param dateOfBirth the dateOfBirth equivalent
     * @param email the email equivalent
     * @param homePhone the homePhone equivalent
     * @param cellPhone the cellPhone equivalent
     * @param address the address equivalent
     * @return FoodCaloriesDomain the class instance
     */
    public static synchronized PatientDomain getInstance(int id, 
						String firstname, 
						String lastname, 
						Date dateOfBirth, 
						String email, 
						String homePhone, 
						String cellPhone, 
						String address){
	if(obj==null){
	    obj=new PatientDomain(id, firstname, lastname, dateOfBirth, email, homePhone, cellPhone, address);
	    return obj;
	}else{
	    return obj;
	}
    }
    
    public static synchronized PatientDomain newData(String firstname, 
						String lastname, 
						Date dateOfBirth, 
						String email, 
						String homePhone, 
						String cellPhone, 
						String address){
	obj=null;
	obj=new PatientDomain(firstname, lastname, dateOfBirth, email, homePhone, cellPhone, address);
	return obj;
    }
    
    public synchronized final void flush(){
	obj=null;
    }

    /**
     * Method to get the fOOD_ID
     * @return the fOOD_ID
     */
    public synchronized final int getPATIENT_ID() {
	    return PATIENT_ID;
    }
    /**
     * Method to get the fOOD_NAME
     * @return the fOOD_NAME
     */
    public synchronized final String getFIRSTNAME() {
	    return FIRSTNAME;
    }
    /**
     * Method to get the rECOMMENDED_DATEOFBIRTH
     * @return the rECOMMENDED_DATEOFBIRTH
     */
    public synchronized final String getLASTNAME() {
	    return LASTNAME;
    }
    /**
     * Method to get the cALORIES
     * @return the cALORIES
     */
    public synchronized final Date getDATEOFBIRTH() {
	    return DATEOFBIRTH;
    }
    /**
     * Method to get the pROTEIN
     * @return the pROTEIN
     */
    public synchronized final String getEMAIL() {
	    return EMAIL;
    }
    /**
     * Method to get the fAT
     * @return the fAT
     */
    public synchronized final String getHOMEPHONE() {
	    return HOMEPHONE;
    }
    /**
     * Method to get the cARBS
     * @return the cARBS
     */
    public synchronized final String getCELLPHONE() {
	    return CELLPHONE;
    }
    /**
     * Method to get the fIBER
     * @return the fIBER
     */
    public synchronized final String getADDRESS() {
	    return ADDRESS;
    }
}
