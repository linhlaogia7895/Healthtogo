/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

/**
 * Document   : CareersDomain.java
 * Version    : April 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for career adverts
 */
public final class ApplicationsDomain {
    private int APPLICATION_ID;
    private final int CAREER_ID;
    private final int INTERN_ID;
    private final int VOLUNTEER_ID;
    private final String NAME;
    private final String EMAIL;
    private final String CONTACT_NUMBER;
    private final String COVER_LETTER;
    private final String RESUME_PATH;

    /**
     * Private constructor for ApplicationsDomain
     * @param APPLICATION_ID the application ID
     * @param CAREER_ID the career ID
     * @param INTERN_ID the intern ID
     * @param VOLUNTEER_ID the volunteer ID
     * @param NAME the applicant's name
     * @param EMAIL the applicant's email
     * @param CONTACT_NUMBER the applicant's contact number
     * @param COVER_LETTER the applicant's cover letter
     * @param RESUME_PATH the application's storage path
     */
    private ApplicationsDomain(int APPLICATION_ID, 
				int CAREER_ID, 
				int INTERN_ID, 
				int VOLUNTEER_ID, 
				String NAME, 
				String EMAIL, 
				String CONTACT_NUMBER, 
				String COVER_LETTER, 
				String RESUME_PATH) {
	this.APPLICATION_ID = APPLICATION_ID;
	this.CAREER_ID = CAREER_ID;
	this.INTERN_ID = INTERN_ID;
	this.VOLUNTEER_ID = VOLUNTEER_ID;
	this.NAME = NAME;
	this.EMAIL = EMAIL;
	this.CONTACT_NUMBER = CONTACT_NUMBER;
	this.COVER_LETTER = COVER_LETTER;
	this.RESUME_PATH = RESUME_PATH;
    }
    
   /**
     * Private constructor for new data
     * @param CAREER_ID the career ID
     * @param INTERN_ID the intern ID
     * @param VOLUNTEER_ID the volunteer ID
     * @param NAME the applicant's name
     * @param EMAIL the applicant's email
     * @param CONTACT_NUMBER the applicant's contact number
     * @param COVER_LETTER the applicant's cover letter
     * @param RESUME_PATH the application's storage path
     */
    private ApplicationsDomain(	int CAREER_ID, 
				int INTERN_ID, 
				int VOLUNTEER_ID, 
				String NAME, 
				String EMAIL, 
				String CONTACT_NUMBER, 
				String COVER_LETTER, 
				String RESUME_PATH) {
	this.CAREER_ID = CAREER_ID;
	this.INTERN_ID = INTERN_ID;
	this.VOLUNTEER_ID = VOLUNTEER_ID;
	this.NAME = NAME;
	this.EMAIL = EMAIL;
	this.CONTACT_NUMBER = CONTACT_NUMBER;
	this.COVER_LETTER = COVER_LETTER;
	this.RESUME_PATH = RESUME_PATH;
    }
    
    private static ApplicationsDomain obj=null;
    
    /**
     * Method to create and/or return an instance of the class
     * @param APPLICATION_ID the application ID
     * @param CAREER_ID the career ID
     * @param INTERN_ID the intern ID
     * @param VOLUNTEER_ID the volunteer ID
     * @param NAME the applicant's name
     * @param EMAIL the applicant's email
     * @param CONTACT_NUMBER the applicant's contact number
     * @param COVER_LETTER the applicant's cover letter
     * @param RESUME_PATH the application's storage path
     * @return ApplicationsDomain the class instance
     */
    public static synchronized ApplicationsDomain getInstance(int APPLICATION_ID, 
				int CAREER_ID, 
				int INTERN_ID, 
				int VOLUNTEER_ID, 
				String NAME, 
				String EMAIL, 
				String CONTACT_NUMBER, 
				String COVER_LETTER, 
				String RESUME_PATH){
	if(obj==null){
	    obj=new ApplicationsDomain(APPLICATION_ID, 
					CAREER_ID, 
					INTERN_ID, 
					VOLUNTEER_ID, 
					NAME, EMAIL, 
					CONTACT_NUMBER, 
					COVER_LETTER, 
					RESUME_PATH);
	    return obj;
	}else{
	    return obj;
	}
    }
    
        /**
     * Method for constructing new applications data
     * @param APPLICATION_ID the application ID
     * @param CAREER_ID the career ID
     * @param INTERN_ID the intern ID
     * @param VOLUNTEER_ID the volunteer ID
     * @param NAME the applicant's name
     * @param EMAIL the applicant's email
     * @param CONTACT_NUMBER the applicant's contact number
     * @param COVER_LETTER the applicant's cover letter
     * @param RESUME_PATH the application's storage path
     * @return ApplicationsDomain the class instance
     */
    public static synchronized ApplicationsDomain newData(int CAREER_ID, 
							int INTERN_ID, 
							int VOLUNTEER_ID, 
							String NAME, 
							String EMAIL, 
							String CONTACT_NUMBER, 
							String COVER_LETTER, 
							String RESUME_PATH){
	obj=null;
	obj=new ApplicationsDomain( CAREER_ID, 
				    INTERN_ID, 
				    VOLUNTEER_ID, 
				    NAME, EMAIL, 
				    CONTACT_NUMBER, 
				    COVER_LETTER, 
				    RESUME_PATH);
	return obj;
    }    
    
    /**
     * Method to flush class object
     */
    public synchronized void flush(){
	obj=null;
    }
    
    /**
     * Method to get the aPPLICATION_ID
     * @return the aPPLICATION_ID
     */
    public synchronized final int getAPPLICATION_ID() {
	    return APPLICATION_ID;
    }
    /**
     * Method to get the cAREER_ID
     * @return the cAREER_ID
     */
    public synchronized final int getCAREER_ID() {
	    return CAREER_ID;
    }
    /**
     * Method to get the iNTERN_ID
     * @return the iNTERN_ID
     */
    public synchronized final int getINTERN_ID() {
	    return INTERN_ID;
    }
    /**
     * Method to get the vOLUNTEER_ID
     * @return the vOLUNTEER_ID
     */
    public synchronized final int getVOLUNTEER_ID() {
	    return VOLUNTEER_ID;
    }
    /**
     * Method to get the nAME
     * @return the nAME
     */
    public synchronized final String getNAME() {
	    return NAME;
    }
    /**
     * Method to get the eMAIL
     * @return the eMAIL
     */
    public synchronized final String getEMAIL() {
	    return EMAIL;
    }
    /**
     * Method to get the cONTACT_NUMBER
     * @return the cONTACT_NUMBER
     */
    public synchronized final String getCONTACT_NUMBER() {
	    return CONTACT_NUMBER;
    }
    /**
     * Method to get the cOVER_LETTER
     * @return the cOVER_LETTER
     */
    public synchronized final String getCOVER_LETTER() {
	    return COVER_LETTER;
    }
    /**
     * Method to get the rESUME_PATH
     * @return the rESUME_PATH
     */
    public synchronized final String getRESUME_PATH() {
	    return RESUME_PATH;
    }
}
