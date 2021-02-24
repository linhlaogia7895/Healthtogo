/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.main;

import domains.main.CareersDomain;
import domains.main.InternsDomain;
import java.awt.TextArea;
import java.sql.Date;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 * Document   : NutritionLibraryBean.java
 * Version    : March 9, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Bean local for AdvertsBean
 */
@Local
public interface AdvertsBeanLocal {
    ArrayList getAllNews();
    ArrayList getNewsById(int newsId);
    ArrayList getAllPromos();
    ArrayList getPromoById(int promoId);
    ArrayList getAllCareers();
    CareersDomain getCareerById(int careerId);
    ArrayList getAllInterns();
    InternsDomain getInternById(int interId);
    ArrayList getAllVolunteers();
    ArrayList getVolunteerById(int volunteerId);
    ArrayList getAllApplications();
    ArrayList getApplicationById(int applicationId);
    
    boolean addNews(String username, 
		    String newsTitle, 
		    String newsHref, 
		    String hrefLabel,
		    String newsContent);
    
    boolean addPromo(String username,
		    int closingDate,
		    String promoContent);
    
    boolean addCareer(String username, 
		    String title,
		    String category,
		    String employmentType,
		    Date closingDate,
		    String positionRequirements);
    
    boolean addIntern(String username,
		    String title,
		    String category,
		    String employmentType,
		    Date closingDate,
		    String positionRequirements);
    
    boolean addVolunteer(String username,
		    String title,
		    String category,
		    String employmentType,
		    Date closingDate,
		    String positionRequirements);
    
    boolean addApplication(String username,
			    int careerID,
			    int internID,
			    int volunteerID,
			    String name,
			    String email,
			    String contactNumber,
			    String coverLetter,
			    String resumePath);
    
    boolean editNews(String userName,
		    int newsId,
		    String newsTitle,
		    Date datePosted, 
		    String href, 
		    String hrefLabel, 
		    String content);
    
    boolean editPromo(String username, 
		    int promoId, 
		    Date datePosted, 
		    Date closingDate, 
		    String content);
    
    boolean editCareer(String username, 
		    int careerId, 
		    String title, 
		    String positionCategory,
		    String employmentType,
		    Date datePosted,
		    Date closingDate,
		    String positionRequirements);
    
    boolean editIntern(String username, 
		    int internId, 
		    String title, 
		    String positionCategory,
		    String employmentType,
		    Date datePosted,
		    Date closingDate,
		    String positionRequirements);
    
    boolean editVolunteer(String username, 
		    int internId, 
		    String title, 
		    String positionCategory,
		    String employmentType,
		    Date datePosted,
		    Date closingDate,
		    String positionRequirements);
    
    boolean editApplication(String username, 
		    int applicationId,
		    int careerId,
		    int internId,
		    int volunteerId,
		    String theName,
		    String theEmail,
		    String contactNumber,
		    String coverLetter,
		    String resumePath);
    
    boolean removeNews(String username, int newsId);
    
    boolean removePromo(String username, int promoId);

    boolean removeCareer(String username, int careerId);
    
    boolean removeIntern(String username, int internId);
    
    boolean removeVolunteer(String username, int volunteerId);
    
    boolean removeApplication(String username, int applicationId);
}
