/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.main;

import domains.main.ApplicationsDomain;
import domains.main.CareersDomain;
import domains.main.NewsDomain;
import domains.main.PromosDomain;
import domains.main.VolunteersDomain;
import domains.main.InternsDomain;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Document   : NutritionLibraryBean.java
 * Version    : March 9, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Bean for all adverts
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
@Singleton
public class AdvertsBean implements AdvertsBeanLocal {
    /**
     * Method to create an instance of the connection to the MYSQL DBase
     * @return Connection the connection to the DBAse
     */
    @Lock(LockType.READ)
    private Connection getConnection(){
	Connection conn=null;
	
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    InitialContext ic=new InitialContext();
	    DataSource ds=(DataSource)ic.lookup("jdbc/htgConnectionPool");
	    conn=ds.getConnection();
	} catch (ClassNotFoundException | NamingException | SQLException ex) {
	    Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	}
	return conn;
    }

    /**
     * Method to get all news
     * @return ArrayList the news list
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getAllNews() {
	
	PreparedStatement ps=null;	
	ResultSet rs=null;
	try {
	    ArrayList<Object> newsList=new ArrayList();
	    
	    try (Connection conn = getConnection()) {
		String sql="{call getNews()}";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		    NewsDomain nd=NewsDomain.getInstance(rs.getInt(1),
							rs.getString(2),
							rs.getDate(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6));
		    newsList.add(nd);
		}
		
		conn.close();
	    }
	    
	    return newsList;
	    
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get news by Id
     * @param newsId the news Id to search for
     * @return ArrayList the news record found
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getNewsById(int newsId) {
	    PreparedStatement ps=null;
	    ResultSet rs=null;
	    Connection conn=null;
	    
	try {
	    
	    ArrayList<Object> newsList=new ArrayList();
	    
	    conn=getConnection();
	    String sql="{call getNewsById(?)}";
	    ps=conn.prepareStatement(sql);
	    ps.setInt(1,newsId);
	    rs=ps.executeQuery();
	    while(rs.next()){
		NewsDomain nd=NewsDomain.getInstance(rs.getInt(1),
						    rs.getString(2),
						    rs.getDate(3),
						    rs.getString(4),
						    rs.getString(5),
						    rs.getString(6));
		newsList.add(nd);
	    }
	    
	    return newsList;
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
		try {
		    rs.close();
		    ps.close();
		    conn.close();
		} catch (SQLException ex) {
		    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	return null;
    }

    /**
     * Method to return all promos
     * @return ArrayList the list of promos
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getAllPromos() {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		ArrayList<Object> promosList=new ArrayList<>();
		String sql="{call getPromo()}";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while (rs.next()) {
		    PromosDomain pd=PromosDomain.getInstance(rs.getInt(1), 
							    rs.getDate(2), 
							    rs.getDate(3), 
							    rs.getString(4));
		    promosList.add(pd);
		}
		conn.close();
		
		return promosList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get a promo by Id
     * @param promoId the promo Id to search
     * @return ArrayList the promo found
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getPromoById(int promoId) {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    ArrayList<Object> promosList;
	    try (Connection conn = getConnection()) {
		promosList = new ArrayList<>();
		String sql="{call getPromoById(?)}";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, promoId);
		rs=ps.executeQuery();
		while(rs.next()){
		    PromosDomain pd=PromosDomain.getInstance(rs.getInt(1), 
							    rs.getDate(2), 
							    rs.getDate(3), 
							    rs.getString(4));
		    promosList.add(pd);
		}
		
		conn.close();
	    }
	    
	    return promosList;
	    
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get all careers
     * @return ArrayList the careers list
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getAllCareers() {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getCareer()}";
		ArrayList<Object> careersList=new ArrayList<>();
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		    CareersDomain cd=CareersDomain.getInstance(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getDate(5),
								rs.getDate(6),
								rs.getString(7));
		    careersList.add(cd);
		    cd.flush();
		}
		
		conn.close();
		
		return careersList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }
    
    /**
     * Method to get a career by Id
     * @param careerId the career to search for
     * @return ArrayList the career found
     */
    @Lock(LockType.READ)
    @Override
    public CareersDomain getCareerById(int careerId) {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getCareerById(?)}";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, careerId);
		rs=ps.executeQuery();
		rs.next();
		CareersDomain cd=CareersDomain.getInstance(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getDate(5),
								rs.getDate(6),
								rs.getString(7));
		
		conn.close();
		cd.flush();
		return cd;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get all interns
     * @return ArrayList the interns list
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getAllInterns() {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getIntern()}";
		ArrayList<Object> internsList=new ArrayList<>();
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		    InternsDomain id=InternsDomain.getInstance(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getDate(5),
								rs.getDate(6),
								rs.getString(7));
		    internsList.add(id);
		    id.flush();
		}
		
		conn.close();
		
		return internsList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get intern by Id
     * @param internId the intern Id to search for
     * @return ArrayList the intern found
     */
    @Lock(LockType.READ)
    @Override
    public InternsDomain getInternById(int internId) {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getInternById(?)}";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, internId);
		rs=ps.executeQuery();
		rs.next();
		InternsDomain id=InternsDomain.getInstance(rs.getInt(1),
						    rs.getString(2),
						    rs.getString(3),
						    rs.getString(4),
						    rs.getDate(5),
						    rs.getDate(6),
						    rs.getString(7));
		conn.close();
		id.flush();
		
		return id;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get all volunteers
     * @return ArrayList the volunteers list
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getAllVolunteers() {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getVolunteer()}";
		ArrayList<Object> volunteersList=new ArrayList<>();
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		    VolunteersDomain vd=VolunteersDomain.getInstance(rs.getInt(1),
								    rs.getString(2),
								    rs.getString(3),
								    rs.getString(4),
								    rs.getDate(5),
								    rs.getDate(6),
								    rs.getString(7));
		    volunteersList.add(vd);
		}
		
		conn.close();
		
		return volunteersList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get a volunteer by Id
     * @param volunteerId the volunteer Id to search for
     * @return ArrayList the volunteer record found
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getVolunteerById(int volunteerId) {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getVolunteerById(?)}";
		ArrayList<Object> volunteersList=new ArrayList<>();
		ps=conn.prepareStatement(sql);
		ps.setInt(1, volunteerId);
		rs=ps.executeQuery();
		while(rs.next()){
		    VolunteersDomain vd=VolunteersDomain.getInstance(rs.getInt(1),
								    rs.getString(2),
								    rs.getString(3),
								    rs.getString(4),
								    rs.getDate(5),
								    rs.getDate(6),
								    rs.getString(7));
		    volunteersList.add(vd);
		}
		
		conn.close();
		
		return volunteersList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get all applications
     * @return ArrayList the applications list
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getAllApplications() {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getApplication()}";
		ArrayList<Object> applicationsList=new ArrayList<>();
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		    ApplicationsDomain ad=ApplicationsDomain.getInstance(rs.getInt(1),
									rs.getInt(2),
									rs.getInt(3),
									rs.getInt(4),
									rs.getNString(5),
									rs.getNString(6),
									rs.getNString(7),
									rs.getNString(8),
									rs.getNString(9));
		    applicationsList.add(ad);
		}
		
		conn.close();
		
		return applicationsList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get an application by Id
     * @param applicationId the application Id to search for
     * @return ArrayList the application record found
     */
    @Lock(LockType.READ)
    @Override
    public ArrayList getApplicationById(int applicationId) {
	PreparedStatement ps=null;
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getApplicationById(?)}";
		ArrayList<Object> applicationsList=new ArrayList<>();
		ps=conn.prepareStatement(sql);
		ps.setInt(1, applicationId);
		rs=ps.executeQuery();
		while(rs.next()){
		    ApplicationsDomain ad=ApplicationsDomain.getInstance(rs.getInt(1),
									rs.getInt(2),
									rs.getInt(3),
									rs.getInt(4),
									rs.getNString(5),
									rs.getNString(6),
									rs.getNString(7),
									rs.getNString(8),
									rs.getNString(9));
		    applicationsList.add(ad);
		}
		
		conn.close();
		
		return applicationsList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;    
    }

    /**
     * Method to add news
     * @param username the username of the logged in user adding the news
     * @param newsTitle the news Title
     * @param newsHref the news link
     * @param hrefLabel the link label
     * @param newsContent the news content
     * @return true if the news is added
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean addNews(String username, String newsTitle, String newsHref, String hrefLabel, String newsContent) {
	boolean newsAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addNews(?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, newsTitle);
		ps.setString(3, newsHref);
		ps.setString(4, hrefLabel);
		ps.setString(5, newsContent);
		ps.executeUpdate();
		newsAdded=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return newsAdded;
    }

    /**
     * Method to add promo
     * @param username the username of the logged in user adding the promo
     * @param closingDate the closing date of the promo
     * @param promoContent the promo content
     * @return true if the promo is added
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean addPromo(String username, int closingDate, String promoContent) {
    	boolean promoAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addPromo(?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, closingDate);
		ps.setString(3, promoContent);
		ps.executeUpdate();
		promoAdded=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return promoAdded;
    }

    /**
     * Method to add a career
     * @param username the username of the logged in user adding the promo
     * @param title the position title for the career
     * @param category the position category for the career
     * @param employmentType the employment type for the career
     * @param closingDate the closing date of the advert for hiring
     * @param positionRequirements the requirements for the position
     * @return true if the carerr is added
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean addCareer(String username, String title, String category, String employmentType, Date closingDate, String positionRequirements) {
   	boolean careerAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addCareer(?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, title);
		ps.setString(3, category);
		ps.setString(4, employmentType);
		ps.setDate(5, closingDate);
		ps.setString(6, positionRequirements);
		ps.executeUpdate();
		careerAdded=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return careerAdded;
    }

    /**
     * Method to add intern
     * @param username the registered user name
     * @param title the position title
     * @param category the position category
     * @param employmentType the position employment type
     * @param closingDate the intern closing date
     * @param positionRequirements the intern position requirements
     * @return true if the intern is added
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean addIntern(String username, String title, String category, String employmentType, Date closingDate, String positionRequirements) {
      	boolean internAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addIntern(?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, title);
		ps.setString(3, category);
		ps.setString(4, employmentType);
		ps.setDate(5, closingDate);
		ps.setString(6, positionRequirements);
		ps.executeUpdate();
		internAdded=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return internAdded;
    }

    /**
     * 
     * Method to add volunteer
     * @param username the registered user name
     * @param title the position title
     * @param category the position category
     * @param employmentType the position employment type
     * @param closingDate the volunteer closing date
     * @param positionRequirements the volunteer position requirements
     * @return true if the volunteer is added
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean addVolunteer(String username, String title, String category, String employmentType, Date closingDate, String positionRequirements) {
	boolean volunteerAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addVolunteer(?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setString(2, title);
		ps.setString(3, category);
		ps.setString(4, employmentType);
		ps.setDate(5, closingDate);
		ps.setString(6, positionRequirements);
		ps.executeUpdate();
		volunteerAdded=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return volunteerAdded;
    }
    
    /**
     * Method to add application data
     * @param careerID the career ID
     * @param internID the intern ID
     * @param volunteerID the volunteer ID
     * @param name the applicant's name
     * @param email the applicant's email
     * @param contactNumber the applicant's contact number
     * @param coverLetter the applicant's cover letter
     * @param resumePath the applicant's resume storage path
     * @return true if the application is saved into the database
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean addApplication(String username, 
				    int careerID, 
				    int internID, 
				    int volunteerID, 
				    String name, 
				    String email, 
				    String contactNumber, 
				    String coverLetter, 
				    String resumePath) {
	boolean applicationAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addApplication(?,?,?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, careerID);
		ps.setInt(3, internID);
		ps.setInt(4, volunteerID);
		ps.setString(5, name);
		ps.setString(6, email);
		ps.setString(7, contactNumber);
		ps.setString(8, coverLetter);
		ps.setString(9, resumePath);
		ps.executeUpdate();
		applicationAdded=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return applicationAdded;
    }
    
    /**
     * Method to edit news
     * @param userName the registered user name
     * @param newsId the news ID
     * @param newsTitle the news Title
     * @param datePosted the date the news was posted
     * @param href the URL link of the news article
     * @param hrefLabel the URL link label for HTML
     * @param content the article long content
     * @return true if the news is edited
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean editNews(String userName, int newsId, String newsTitle, Date datePosted, String href, String hrefLabel, String content) {
	boolean newsEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call editNews(?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, userName);
		ps.setInt(2, newsId);
		ps.setString(3, newsTitle);
		ps.setDate(4, datePosted);
		ps.setString(5, href);
		ps.setString(6, hrefLabel);
		ps.setString(7, content);
		ps.executeUpdate();
		newsEdited=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return newsEdited;
    }

    /**
     * Method to edit the promotion
     * @param username the registered user name
     * @param promoId the promotion ID
     * @param datePosted the date the promotion was posted
     * @param closingDate the promotion closing date
     * @param content the promotion content
     * @return true if the promotion is edited
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean editPromo(String username, int promoId, Date datePosted, Date closingDate, String content) {
    	boolean promoEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call editPromo(?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, promoId);
		ps.setDate(3, datePosted);
		ps.setDate(4, closingDate);
		ps.setString(5, content);
		ps.executeUpdate();
		promoEdited=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return promoEdited;
    }

    /**
     * Method to edit career
     * @param username the registered user name
     * @param careerId the career ID
     * @param title the career title
     * @param positionCategory the career position category
     * @param employmentType the position employment type
     * @param datePosted the date the career was posted
     * @param closingDate the date the career posting expires
     * @param positionRequirements the requirements for the position
     * @return true if the career is added
     */
    @Lock(LockType.WRITE)    
    @Override
    public boolean editCareer(String username, int careerId, String title, String positionCategory, String employmentType, Date datePosted, Date closingDate, String positionRequirements) {
   	boolean careerEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call editCareer(?,?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, careerId);
		ps.setString(3, title);
		ps.setString(4, positionCategory);
		ps.setString(5, employmentType);
		ps.setDate(6, datePosted);
		ps.setDate(7, closingDate);
		ps.setString(8, positionRequirements);
		ps.executeUpdate();
		careerEdited=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return careerEdited;	
    }

    /**
     * Method to edit internt
     * @param username the registered user name
     * @param internId the intern ID
     * @param title the intern title
     * @param positionCategory the intern position category
     * @param employmentType the intern employment type
     * @param datePosted the date the intern position was posted
     * @param closingDate the closing date
     * @param positionRequirements the position requirements
     * @return true if the intern is edited
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean editIntern(String username, int internId, String title, String positionCategory, String employmentType, Date datePosted, Date closingDate, String positionRequirements) {
	boolean careerEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call editIntern(?,?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, internId);
		ps.setString(3, title);
		ps.setString(4, positionCategory);
		ps.setString(5, employmentType);
		ps.setDate(6, datePosted);
		ps.setDate(7, closingDate);
		ps.setString(8, positionRequirements);
		ps.executeUpdate();
		careerEdited=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return careerEdited;	
    }

    /**
     * Method to edit volunteer
     * @param username the registered user name
     * @param volunteerId the volunteer position ID
     * @param title the volunteer position title
     * @param positionCategory the volunteer position category
     * @param employmentType the position employment type
     * @param datePosted the date the volunteer position was posted
     * @param closingDate the date the posting expires
     * @param positionRequirements the position requirements
     * @return true if the volunteer position is edited
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean editVolunteer(String username, int volunteerId, String title, String positionCategory, String employmentType, Date datePosted, Date closingDate, String positionRequirements) {
   	boolean volunteerEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call editVolunteer(?,?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, volunteerId);
		ps.setString(3, title);
		ps.setString(4, positionCategory);
		ps.setString(5, employmentType);
		ps.setDate(6, datePosted);
		ps.setDate(7, closingDate);
		ps.setString(8, positionRequirements);
		ps.executeUpdate();
		volunteerEdited=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return volunteerEdited;
    }

    /**
     * Method to edit application
     * @param username the registered user name
     * @param applicationId the application ID
     * @param careerId the career ID
     * @param internId the intern ID
     * @param volunteerId the volunteer ID
     * @param theName the applicant's name
     * @param theEmail the applicant's email
     * @param contactNumber the applicant's contact number
     * @param coverLetter the applicant's cover letter
     * @param resumePath the applicant's resume path
     * @return true if the application is edited
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean editApplication(String username, 
				    int applicationId, 
				    int careerId, 
				    int internId, 
				    int volunteerId, 
				    String theName, 
				    String theEmail, 
				    String contactNumber, 
				    String coverLetter, 
				    String resumePath) {
       	boolean applicationEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call editApplication(?,?,?,?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, applicationId);
		ps.setInt(3, careerId);
		ps.setInt(4, internId);
		ps.setInt(5, volunteerId);
		ps.setString(6, theName);
		ps.setString(7, theEmail);
		ps.setString(8, contactNumber);
		ps.setString(9, coverLetter);
		ps.setString(10, resumePath);
		ps.executeUpdate();
		applicationEdited=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return applicationEdited;
    }

    /**
     * Method to remove news
     * @param username the registered user name
     * @param newsId the news ID
     * @return true if the news is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean removeNews(String username, int newsId) {
	boolean newsRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removeNews(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, newsId);
		ps.executeUpdate();
		newsRemoved=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return newsRemoved;
    }

    /**
     * Method to remove the promotion
     * @param username the registered user name
     * @param promoId the promotion ID of the promotion to remove
     * @return true if the promo is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean removePromo(String username, int promoId) {
	boolean promoRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removePromo(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, promoId);
		ps.executeUpdate();
		promoRemoved=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return promoRemoved;
    }

    /**
     * Method to remove career
     * @param username the registered user name
     * @param careerId the career ID of the career to remove
     * @return true if the career is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean removeCareer(String username, int careerId) {
	boolean careerRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removeCareer(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, careerId);
		ps.executeUpdate();
		careerRemoved=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return careerRemoved;
    }

    /**
     * Method to remove the intern
     * @param username the registered user name
     * @param internId the intern Id of the intern to remove
     * @return true if the intern is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean removeIntern(String username, int internId) {
	boolean internRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removeIntern(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, internId);
		ps.executeUpdate();
		internRemoved=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return internRemoved;
    }

    /**
     * Method to remove volunteer
     * @param username the registered user name
     * @param volunteerId the volunteer Id of the volunteer to remove
     * @return true if the volunteer is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean removeVolunteer(String username, int volunteerId) {
	boolean volunteerRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removeVolunteer(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, volunteerId);
		ps.executeUpdate();
		volunteerRemoved=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return volunteerRemoved;
    }

    /**
     * Method to remove application
     * @param username the registered user name
     * @param applicationId the application ID
     * @return true if the application is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public boolean removeApplication(String username, int applicationId) {
	boolean applicationRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removeApplication(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		ps.setInt(2, applicationId);
		ps.executeUpdate();
		applicationRemoved=true;

		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(AdvertsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return applicationRemoved;
    }
}

