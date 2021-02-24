/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

import java.sql.Date;

/**
 * Document   : NewsDomain.java
 * Version    : April 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for news adverts
 */
public final class NewsDomain {

    private final int NEWS_ID;
    private final String TITLE;
    private final Date DATE_POSTED;
    private final String HREF;
    private final String HREF_LABEL;
    private final String CONTENT;
    
    /**
     * private constructor for NewsDomain
     * @param newsID the news ID
     * @param title the news title
     * @param datePosted the date the news is posted
     * @param href the URL link for the news article
     * @param hrefLAbel the label for the URL link
     * @param content the article content
     */
    private NewsDomain(int newsID, String title, Date datePosted, String href, String hrefLAbel, String content) {
	this.NEWS_ID = newsID;
	this.TITLE = title;
	this.DATE_POSTED = datePosted;
	this.HREF = href;
	this.HREF_LABEL = hrefLAbel;
	this.CONTENT = content;
    }

    private static NewsDomain obj=null;
    
    /**
     * Method to return an instance of the class
     * @param newsID the news ID
     * @param title the news title
     * @param datePosted the date the news is posted
     * @param href the URL link for the news article
     * @param hrefLAbel the label for the URL link
     * @param content the article content
     * @return NewsDomain the class instance
     */
    public static synchronized NewsDomain getInstance(int newsID, String title, Date datePosted, String href, String hrefLAbel, String content){
	if(obj==null){
	    obj=new NewsDomain(newsID,title,datePosted,href,hrefLAbel,content);
	    return obj;
	}else{
	    return obj;
	}
    }
    
    /**
     * Method to get the nEWS_ID
     * @return the nEWS_ID
     */
    public synchronized final int getNEWS_ID() {
	    return NEWS_ID;
    }
    /**
     * Method to get the tITLE
     * @return the tITLE
     */
    public synchronized final String getTITLE() {
	    return TITLE;
    }
    /**
     * Method to get the dATE_POSTED
     * @return the dATE_POSTED
     */
    public synchronized final Date getDATE_POSTED() {
	    return DATE_POSTED;
    }
    /**
     * Method to get the hREF
     * @return the hREF
     */
    public synchronized final String getHREF() {
	    return HREF;
    }
    /**
     * Method to get the hREF_LABEL
     * @return the hREF_LABEL
     */
    public synchronized final String getHREF_LABEL() {
	    return HREF_LABEL;
    }
    /**
     * Method to get the cONTENT
     * @return the cONTENT
     */
    public synchronized final String getCONTENT() {
	    return CONTENT;
    }
}
