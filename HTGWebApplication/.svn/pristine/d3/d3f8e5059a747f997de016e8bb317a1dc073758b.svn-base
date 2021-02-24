/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

import java.sql.Date;

/**
 * Document   : VolunteersDomain.java
 * Version    : April 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for volunteer adverts
 */
public final class VolunteersDomain {
    private final int VOLUNTEER_ID;
    private final String POSITION_TITLE;
    private final String POSITION_CATEGORY;
    private final String EMPLOYMENT_TYPE;
    private final Date DATE_POSTED;
    private final Date DATE_CLOSED;
    private final String REQUIREMENTS;

    /**
     * private constructor for VolunteersDomain
     * @param VOLUNTEER_ID the volunteer ID
     * @param POSITION_TITLE the position title 
     * @param POSITION_CATEGORY the position category
     * @param EMPLOYMENT_TYPE the employment type
     * @param DATE_POSTED the date the volunteer position is posted
     * @param DATE_CLOSED the date the posting expires
     * @param REQUIREMENTS the position requirements
     */
    private VolunteersDomain(int VOLUNTEER_ID, 
			    String POSITION_TITLE, 
			    String POSITION_CATEGORY, 
			    String EMPLOYMENT_TYPE, 
			    Date DATE_POSTED, 
			    Date DATE_CLOSED, 
			    String REQUIREMENTS) {
	this.VOLUNTEER_ID = VOLUNTEER_ID;
	this.POSITION_TITLE = POSITION_TITLE;
	this.POSITION_CATEGORY = POSITION_CATEGORY;
	this.EMPLOYMENT_TYPE = EMPLOYMENT_TYPE;
	this.DATE_POSTED = DATE_POSTED;
	this.DATE_CLOSED = DATE_CLOSED;
	this.REQUIREMENTS = REQUIREMENTS;
    }
    
    private static VolunteersDomain obj=null;
    
    /**
     * Method to return an instance of the class
     * @param VOLUNTEER_ID the volunteer ID
     * @param POSITION_TITLE the position title 
     * @param POSITION_CATEGORY the position category
     * @param EMPLOYMENT_TYPE the employment type
     * @param DATE_POSTED the date the volunteer position is posted
     * @param DATE_CLOSED the date the posting expires
     * @param REQUIREMENTS the position requirements
     * @return VolunteersDomain the class instance
     */
    public static synchronized VolunteersDomain getInstance(int VOLUNTEER_ID, 
			    String POSITION_TITLE, 
			    String POSITION_CATEGORY, 
			    String EMPLOYMENT_TYPE, 
			    Date DATE_POSTED, 
			    Date DATE_CLOSED, 
			    String REQUIREMENTS){
	if(obj==null){
	    obj=new VolunteersDomain(VOLUNTEER_ID, 
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
     * Method to get the vOLUNTEER_ID
     * @return the vOLUNTEER_ID
     */
    public synchronized final int getVOLUNTEER_ID() {
	    return VOLUNTEER_ID;
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
