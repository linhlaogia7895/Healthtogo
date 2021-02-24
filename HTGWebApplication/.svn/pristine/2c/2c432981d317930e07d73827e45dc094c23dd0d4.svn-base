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
 * Description: entity class using Singleton for promos adverts
 */
public class PromosDomain {
    private final int PROMO_ID;
    private final Date DATE_POSTED;
    private final Date DATE_EXPIRED;
    private final String CONTENT;

    /**
     * private constructor for PromosDomain
     * @param promoID the promo ID
     * @param datePosted the date the promo is posted
     * @param dateExpired the date the promo expires
     * @param content promot content
     */
    private PromosDomain(int promoID, Date datePosted, Date dateExpired, String content) {
	this.PROMO_ID = promoID;
	this.DATE_POSTED = datePosted;
	this.DATE_EXPIRED = dateExpired;
	this.CONTENT = content;
    }
    
    private static PromosDomain obj=null;
    
    /**
     * Method to return the instance of the class
     * @param promoID the promo ID
     * @param datePosted the date the promo is posted
     * @param dateExpired the date the promo expires
     * @param content promot content
     * @return PromosDomain the class instance
     */
    public static synchronized PromosDomain getInstance(int promoID, Date datePosted, Date dateExpired, String content){
	if(obj==null){
	    obj=new PromosDomain(promoID, datePosted, dateExpired, content);
	    return obj;
	}else{
	    return obj;
	}
    }
    
    /**
     * Method to get the pROMO_ID
     * @return the pROMO_ID
     */
    public synchronized final int getPROMO_ID() {
	    return PROMO_ID;
    }
    /**
     * Method to get the dATE_POSTED
     * @return the dATE_POSTED
     */
    public synchronized final Date getDATE_POSTED() {
	    return DATE_POSTED;
    }
    /**
     * Method to get the dATE_EXPIRED
     * @return the dATE_EXPIRED
     */
    public synchronized final Date getDATE_EXPIRED() {
	    return DATE_EXPIRED;
    }
    /**
     * Method to get the cONTENT
     * @return the cONTENT
     */
    public synchronized final String getCONTENT() {
	    return CONTENT;
    }
}
