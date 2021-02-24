/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.patient;

import beans.main.AdvertsBean;
import beans.main.NutritionLibraryBean;
import domains.main.AppointmentsDomain;
import domains.main.NewsDomain;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.sql.DataSource;

/**
 * Document   : PatientAppointmentsBean.java
 * Version    : April 4, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Bean for all patient appointments
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
@Singleton
@LocalBean
//public class PatientAppointmentsBean implements PatientAppointmentsLocal {
public class PatientAppointmentsBean implements PatientAppointmentsLocal {
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
     * Method to get all appointments
     * @return ArrayList the list of appointments
     */
    @Override
    @Lock(LockType.READ)
    public ArrayList getAllAppointments() {
	
	PreparedStatement ps=null;	
	ResultSet rs=null;
	try {
	    ArrayList<AppointmentsDomain> appointmentsList=new ArrayList();
	    
	    try (Connection conn = getConnection()) {
		String sql="{call getAllAppointment()}";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		    AppointmentsDomain ad=AppointmentsDomain.getInstance(rs.getInt(1), 
									rs.getInt(2), 
									rs.getInt(3), 
									rs.getDate(4),
									rs.getTime(4),
									rs.getDate(5), 
									rs.getTime(5),
									rs.getString(6), 
									rs.getString(7));
		    appointmentsList.add(ad);
		    AppointmentsDomain.flush();
		}
		
		conn.close();
		return appointmentsList;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }
    
    /**
     * Method to get the appointment by ID
     * @param appointmentID the appointment ID to search
     * @return AppointmentsDomain the appointment found
     */
    @Override
    @Lock(LockType.READ)
    public AppointmentsDomain getAppointmentById(int appointmentID) {
	PreparedStatement ps=null;	
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getAppointmentById(?)}";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, appointmentID);
		rs=ps.executeQuery();
		rs.next();
		AppointmentsDomain ad=AppointmentsDomain.getInstance(rs.getInt(1),
								    rs.getInt(2), 
								    rs.getInt(3), 
								    rs.getDate(4), 
								    rs.getTime(4), 
								    rs.getDate(5), 
								    rs.getTime(5), 
								    rs.getString(6), 
								    rs.getString(7));
		conn.close();
		ad.flush();
		return ad;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }

    /**
     * Method to get the all appointments that matched the given date
     * @param date the appointment date to match
     * @return ArrayList the list of appointments found
     */
    @Override
    @Lock(LockType.READ)
    public ArrayList getAppointmentsByDate(Date date) {
	ArrayList<AppointmentsDomain> appointmentsList=getAllAppointments();
	ArrayList<AppointmentsDomain> newList=new ArrayList<>();
	for(AppointmentsDomain a:appointmentsList){
	    if(a.getSTART_DATE()==date){
		newList.add(a);
	    }
	}
	return newList;
    }
    
    /**
     * 
     * Method to add an appointment
     * @param activityUser the logged in user 
     * @param appointmentId the auto-generated appointment ID
     * @param patientId the assigned patient ID
     * @param nutritionId the nutritionist ID attending the patient
     * @param startDate the start Date of the appointment
     * @param startTime the start time of the appointment
     * @param endDate the end date of the appointment
     * @param endTime the end time of the appointment
     * @param appointmentType the appointment type
     * @param thePurpose the purpose of the appointment
     * @return true if the appointment is added
     */
    @Override
    @Lock(LockType.WRITE)
    public boolean editAppointmentById(String activityUser, 
					int appointmentId, 
					int patientId, 
					int nutritionId, 
					Date startDate, 
					Time startTime, 
					Date endDate, 
					Time endTime, 
					String appointmentType, 
					String thePurpose) {
	boolean appointmentEdited=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addAppointment(?,?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, activityUser);
		ps.setInt(2, appointmentId);
		ps.setInt(3, patientId);
		ps.setInt(4, nutritionId);
		ps.setDate(5, startDate);
		ps.setTime(5, startTime);
		ps.setDate(6, endDate);
		ps.setTime(6, endTime);
		ps.setString(7, appointmentType);
		ps.setString(8, thePurpose);
		ps.executeUpdate();
		appointmentEdited=true;
		
		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return appointmentEdited;
	
    }
    
    /**
     * Method to remove appointment
     * @param activityUser the logged in user
     * @param appointmentId the auto-generated appointment ID
     * @return true if the appointment is removed
     */
    @Override
    @Lock(LockType.WRITE)
    public boolean removeAppointmentById(String activityUser, int appointmentId) {
	boolean appointmentRemoved=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call removeAppointmentById(?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, activityUser);
		ps.setInt(2, appointmentId);
		ps.executeUpdate();
		appointmentRemoved=true;
		
		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return appointmentRemoved;
    }

    /**
     * Method to get the patient ID
     * @param username the registered user name
     * @return integer the patient ID
     */
    @Override
    public int getPatientId(String username) {
	
	int foundId=0;
	PreparedStatement ps=null;	
	ResultSet rs=null;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call getTheUserId(?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		rs=ps.executeQuery();
		rs.next();
		if(rs.getInt(1)>0)
		    foundId=rs.getInt(1);
		
		conn.close();
		return foundId;
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return 0;
    }

    /**
     * Method to add appointment
     * @param activityUser the registered user name
     * @param patientId the registered patient ID
     * @param nutritionId the nutrition id
     * @param startDate the start date of the appointment
     * @param startTime the start time of the appointment
     * @param endDate the end date of the appointment
     * @param endTime the end time of the appointment
     * @param appointmentType the appointment type
     * @param thePurpose the purpose of the appointment
     * @return true if the appointment is added
     */
    @Override
    public boolean addAppointment(String activityUser, 
				    int patientId, 
				    int nutritionId, 
				    Timestamp startDate, 
				    Time startTime, 
				    Timestamp endDate, 
				    Time endTime, 
				    String appointmentType, 
				    String thePurpose) {
	boolean appointmentAdded=false;
	PreparedStatement ps=null;	
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call addAppointment(?,?,?,?,?,?,?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, activityUser);
		ps.setInt(2, patientId);
		ps.setInt(3, nutritionId);
		ps.setTimestamp(4, startDate);
//		ps.setDate(4, startDate);
//		ps.setTime(4, startTime);
		ps.setTimestamp(5, endDate);
//		ps.setDate(5, endDate);
//		ps.setTime(5, endTime);
		ps.setString(6, appointmentType);
		ps.setString(7, thePurpose);
		ps.executeUpdate();
		appointmentAdded=true;
		
		conn.close();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientAppointmentsBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return appointmentAdded;
    }

}

