/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

import java.sql.Date;

/**
 * Document   : CareersDomain.java
 * Version    : April 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for career adverts
 */
public final class InternsDomain {
    private int INTERN_ID;
    private final String POSITION_TITLE;
    private final String POSITION_CATEGORY;
    private final String EMPLOYMENT_TYPE;
    private final Date DATE_POSTED;
    private final Date DATE_CLOSED;
    private final String REQUIREMENTS;

    /**
     * private constructor for InternsDomain
     * @param INTERN_ID the intern ID
     * @param POSITION_TITLE the position title
     * @param POSITION_CATEGORY the position category
     * @param EMPLOYMENT_TYPE the employment type
     * @param DATE_POSTED the date the intern position is posted
     * @param DATE_CLOSED the date the posting expires
     * @param REQUIREMENTS the requirements for the position
     */
    private InternsDomain(int INTERN_ID, 
			String POSITION_TITLE, 
			String POSITION_CATEGORY, 
			String EMPLOYMENT_TYPE, 
			Date DATE_POSTED, 
			Date DATE_CLOSED, 
			String REQUIREMENTS) {
	this.INTERN_ID = INTERN_ID;
	this.POSITION_TITLE = POSITION_TITLE;
	this.POSITION_CATEGORY = POSITION_CATEGORY;
	this.EMPLOYMENT_TYPE = EMPLOYMENT_TYPE;
	this.DATE_POSTED = DATE_POSTED;
	this.DATE_CLOSED = DATE_CLOSED;
	this.REQUIREMENTS = REQUIREMENTS;
    }
    
       /**
     * private constructor for new InternsDomain data
     * @param careerID the career ID
     * @param positionTitle the position title
     * @param positionCategory the position category
     * @param employmentType the employment type
     * @param datePosted the date the career is posted
     * @param dateClosed the date the posting is closed
     * @param requirements the requirements for the career position
     */
    private InternsDomain(String positionTitle, 
			String positionCategory, 
			String employmentType, 
			Date datePosted, 
			Date dateClosed, 
			String requirements) {
	this.POSITION_TITLE = positionTitle;
	this.POSITION_CATEGORY = positionCategory;
	this.EMPLOYMENT_TYPE = employmentType;
	this.DATE_POSTED = datePosted;
	this.DATE_CLOSED = dateClosed;
	this.REQUIREMENTS = requirements;
    }
    
    private static InternsDomain obj=null;
    
    /**
     * Method to return an instance of the class
     * @param INTERN_ID the intern ID
     * @param POSITION_TITLE the position title
     * @param POSITION_CATEGORY the position category
     * @param EMPLOYMENT_TYPE the employment type
     * @param DATE_POSTED the date the intern position is posted
     * @param DATE_CLOSED the date the posting expires
     * @param REQUIREMENTS the requirements for the position
     * @return InternsDomain the class instance
     */
    public static synchronized InternsDomain getInstance(int INTERN_ID, 
						String POSITION_TITLE, 
						String POSITION_CATEGORY, 
						String EMPLOYMENT_TYPE, 
						Date DATE_POSTED, 
						Date DATE_CLOSED, 
						String REQUIREMENTS){
	if(obj==null){
	    obj=new InternsDomain(INTERN_ID, 
				POSITION_TITLE, 
				POSITION_CATEGORY, 
				EMPLOYMENT_TYPE, 
				DATE_POSTED, 
				DATE_CLOSED, 
				REQUIREMENTS);
	    return obj;
	}else{
	    return obj;
	}
    }
    
    /**
     * Method to return an instance of the class
     * @param positionTitle the position title
     * @param positionCategory the position category
     * @param employmentType the employment type
     * @param datePosted the date the career is posted
     * @param dateClosed the date the posting is closed
     * @param requirements the requirements for the career position
     * @return CareersDomain the class instance
     */
    public static synchronized InternsDomain newData(String positionTitle, 
			String positionCategory, 
			String employmentType, 
			Date datePosted, 
			Date dateClosed, 
			String requirements){
	obj=null;
	obj=new InternsDomain(positionTitle, 
				positionCategory, 
				employmentType, 
				datePosted, 
				dateClosed, 
				requirements);
	    
	return obj;
    }
    
    /**
     * Method to flush object
     */
    public synchronized void flush(){
	obj=null;
    }
    
    /**
     * Method to get the iNTERN_ID
     * @return the iNTERN_ID
     */
    public synchronized final int getINTERN_ID() {
	    return INTERN_ID;
    }
    /**
     * Method to get the pOSITION_TITLE
     * @return the pOSITION_TITLE
     */
    public synchronized final String getPOSITION_TITLE() {
	    return POSITION_TITLE;
    }
    /**
     * Method to get the pOSITION_CATEGORY
     * @return the pOSITION_CATEGORY
     */
    public synchronized final String getPOSITION_CATEGORY() {
	    return POSITION_CATEGORY;
    }
    /**
     * Method to get the eMPLOYMENT_TYPE
     * @return the eMPLOYMENT_TYPE
     */
    public synchronized final String getEMPLOYMENT_TYPE() {
	    return EMPLOYMENT_TYPE;
    }
    /**
     * Method to get the dATE_POSTED
     * @return the dATE_POSTED
     */
    public synchronized final Date getDATE_POSTED() {
	    return DATE_POSTED;
    }
    /**
     * Method to get the dATE_CLOSED
     * @return the dATE_CLOSED
     */
    public synchronized final Date getDATE_CLOSED() {
	    return DATE_CLOSED;
    }
    /**
     * Method to get the rEQUIREMENTS
     * @return the rEQUIREMENTS
     */
    public synchronized final String getREQUIREMENTS() {
	    return REQUIREMENTS;
    }
}

