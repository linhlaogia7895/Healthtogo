/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.main;

import java.util.ArrayList;
import javax.ejb.Local;

/**
 * Document   : NutritionLibraryLocal.java
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: interface for NutritionLibraryBean.java
 */
@Local
public interface NutritionLibraryBeanLocal {
    
    ArrayList getCaloriesTable();
    
    boolean addCalorie(String activityUser,
			String foodName,
			double recommendedCalorie,
			double calorie,
			double protein,
			double fat,
			double carbs,
			double fiber);
    
    boolean editCalorieTable(String user,
				int id,
				String foodName,
				double recommendedCalorie,
				double calorie,
				double protein,
				double fat,
				double carbs,
				double fiber);
    
    boolean removeCalorie(String user,int id);
    
}
