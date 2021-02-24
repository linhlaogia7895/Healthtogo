/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.main;

import domains.main.FoodCaloriesDomain;
import domains.users.Account;
import domains.users.SecurityQuestion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.util.List;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;

/**
 * Document   : NutritionLibraryBean.java
 * Version    : Feb 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Bean for nutrition library
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
//@Stateless
@Singleton
public class NutritionLibraryBean implements NutritionLibraryBeanLocal {
    
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
     * Method to get the calories table
     * @return ArrayList<FoodCalories> the calories table constituted
     */
    @Lock(LockType.READ)
    @Override
    public final ArrayList getCaloriesTable() {
	ArrayList<FoodCaloriesDomain> caloriesList=new ArrayList<>();
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	Connection conn = null;
	try {
		conn = getConnection(); 
		String sql="{call getNutritionLibrary()}";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
		    FoodCaloriesDomain fc=FoodCaloriesDomain.getInstance(rs.getInt(1),
			    rs.getString(2),
			    rs.getDouble(3),
			    rs.getDouble(4),
			    rs.getDouble(5),
			    rs.getDouble(6),
			    rs.getDouble(7),
			    rs.getDouble(8));
		    caloriesList.add(fc);
		    fc.flush();
	    }
	} catch (SQLException ex) {
	    Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
		rs.close();
	    } catch (SQLException ex) {
		Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return caloriesList;
    }

    
    /**
     * Method to add calorie to the table
     * @param activityUser the activity user
     * @param foodName the food name
     * @param recommendedCalorie the recommended calorie
     * @param calorie the calorie for 100g of the food
     * @param protein the protein for 100g of the food
     * @param fat the fat for 100g of the food
     * @param carbs the carbs for 100g of the food
     * @param fiber the fiber for 100g of the food
     * @return true if the calorie has been added
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean addCalorie(String activityUser,
			    String foodName, 
			    double recommendedCalorie, 
			    double calorie, 
			    double protein, 
			    double fat, 
			    double carbs, 
			    double fiber) {
	
	PreparedStatement ps=null;
	Connection conn=null;
	
	boolean added=false;
	
	try {
		conn = getConnection(); 
		String sql="{call addNutritionLibrary(?,?,?,?,?,?,?,?)}";
		ps = conn.prepareStatement(sql);
		ps.setString(1, activityUser);
		ps.setString(2, foodName);
		ps.setDouble(3, recommendedCalorie);
		ps.setDouble(4, calorie);
		ps.setDouble(5, protein);
		ps.setDouble(6, fat);
		ps.setDouble(7, carbs);
		ps.setDouble(8, fiber);
		ps.executeUpdate();
		added=true;
	} catch (SQLException ex) {
	    Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	} finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return added;
    }

    
    /**
     * Method to edit calorie table
     * @param user the session username
     * @param id the food it
     * @param foodName the food name
     * @param recommendedCalorie the recommended calorie
     * @param calorie the calorie for 100g of the food
     * @param protein the protein for 100g of the food
     * @param fat the fat for 100g of the food
     * @param carbs the carbs for 100g of the food
     * @param fiber the fiber for 100g of the food
     * @return true if the calorie has been edited
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean editCalorieTable(String user, 
					int id, 
					String foodName, 
					double recommendedCalorie, 
					double calorie, 
					double protein, 
					double fat, 
					double carbs, 
					double fiber) {
	boolean edited=false;
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	try {
	    conn = getConnection(); 
	    String sql="{call editNutritionLibrary(?,?,?,?,?,?,?,?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, user);
	    ps.setInt(2, id);
	    ps.setString(3, foodName);
	    ps.setDouble(4, recommendedCalorie);
	    ps.setDouble(5, calorie);
	    ps.setDouble(6, protein);
	    ps.setDouble(7, fat);
	    ps.setDouble(8, carbs);
	    ps.setDouble(9, fiber);
	    ps.executeUpdate();
	    edited=true;
		
	} catch (SQLException ex) {
	    Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	
	return edited;
    }

    
    /**
     * Method to remove calorie
     * @param user the session user
     * @param id the food id
     * @return true if calorie is removed
     */
    @Lock(LockType.WRITE)
    @Override
    public final boolean removeCalorie(String user, int id) {
	boolean removed=false;
	
	Connection conn = null;
	PreparedStatement ps = null;
	try {
	    
	    conn = getConnection();String sql="{call removeFoodFromNutritionLibrary(?,?)}";
	    ps = conn.prepareStatement(sql);
	    ps.setString(1, user);
	    ps.setInt(2, id);
	    ps.executeUpdate();
	    removed=true;
	    
	    
	} catch (SQLException ex) {
	    Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		/*closing inside finally prevents an accidental Dos when the app encounters an exception and fails
		to close the connection handle*/
		conn.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(NutritionLibraryBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	
	return removed;
    }
}
