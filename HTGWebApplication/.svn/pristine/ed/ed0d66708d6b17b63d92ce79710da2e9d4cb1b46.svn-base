/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

/**
 * Document   : FoodCaloriesDomain.java
 * Version    : Feb 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for jdbc Nutrition calorie table
 */
public final class FoodCaloriesDomain {
    private int FOOD_ID;
    private final String FOOD_NAME;
    private final double RECOMMENDED_CALORIES;
    private final double CALORIES;
    private final double PROTEIN;
    private final double FAT;
    private final double CARBS;
    private final double FIBER;

    /**
     * private constructor for FoodCaloriesDomain
     * @param id the food ID
     * @param foodName the food name
     * @param recommendedCalories the recommended calories
     * @param calories the calories equivalent
     * @param protein the protein equivalent
     * @param fat the fat equivalent
     * @param carbs the carbs equivalent
     * @param fiber the fiber equivalent
     */
    private FoodCaloriesDomain(int id, 
			String foodName, 
			double recommendedCalories, 
			double calories, 
			double protein, 
			double fat, 
			double carbs, 
			double fiber) {
	this.FOOD_ID = id;
	this.FOOD_NAME = foodName;
	this.RECOMMENDED_CALORIES = recommendedCalories;
	this.CALORIES = calories;
	this.PROTEIN = protein;
	this.FAT = fat;
	this.CARBS = carbs;
	this.FIBER = fiber;
    }
    
        private FoodCaloriesDomain(String foodName, 
			double recommendedCalories, 
			double calories, 
			double protein, 
			double fat, 
			double carbs, 
			double fiber) {
	this.FOOD_NAME = foodName;
	this.RECOMMENDED_CALORIES = recommendedCalories;
	this.CALORIES = calories;
	this.PROTEIN = protein;
	this.FAT = fat;
	this.CARBS = carbs;
	this.FIBER = fiber;
    }
    
    private static FoodCaloriesDomain obj=null;
    
    /**
     * Method to return an instance of the class
     * @param id the food ID
     * @param foodName the food name
     * @param recommendedCalories the recommended calories
     * @param calories the calories equivalent
     * @param protein the protein equivalent
     * @param fat the fat equivalent
     * @param carbs the carbs equivalent
     * @param fiber the fiber equivalent
     * @return FoodCaloriesDomain the class instance
     */
    public static synchronized FoodCaloriesDomain getInstance(int id, 
						String foodName, 
						double recommendedCalories, 
						double calories, 
						double protein, 
						double fat, 
						double carbs, 
						double fiber){
	if(obj==null){
	    obj=new FoodCaloriesDomain(id, foodName, recommendedCalories, calories, protein, fat, carbs, fiber);
	    return obj;
	}else{
	    return obj;
	}
    }
    
    public static synchronized FoodCaloriesDomain newData(String foodName, 
						double recommendedCalories, 
						double calories, 
						double protein, 
						double fat, 
						double carbs, 
						double fiber){
	obj=null;
	obj=new FoodCaloriesDomain(foodName, recommendedCalories, calories, protein, fat, carbs, fiber);
	return obj;
    }
    
    public synchronized final void flush(){
	obj=null;
    }

    /**
     * Method to get the fOOD_ID
     * @return the fOOD_ID
     */
    public synchronized final int getFOOD_ID() {
	    return FOOD_ID;
    }
    /**
     * Method to get the fOOD_NAME
     * @return the fOOD_NAME
     */
    public synchronized final String getFOOD_NAME() {
	    return FOOD_NAME;
    }
    /**
     * Method to get the rECOMMENDED_CALORIES
     * @return the rECOMMENDED_CALORIES
     */
    public synchronized final double getRECOMMENDED_CALORIES() {
	    return RECOMMENDED_CALORIES;
    }
    /**
     * Method to get the cALORIES
     * @return the cALORIES
     */
    public synchronized final double getCALORIES() {
	    return CALORIES;
    }
    /**
     * Method to get the pROTEIN
     * @return the pROTEIN
     */
    public synchronized final double getPROTEIN() {
	    return PROTEIN;
    }
    /**
     * Method to get the fAT
     * @return the fAT
     */
    public synchronized final double getFAT() {
	    return FAT;
    }
    /**
     * Method to get the cARBS
     * @return the cARBS
     */
    public synchronized final double getCARBS() {
	    return CARBS;
    }
    /**
     * Method to get the fIBER
     * @return the fIBER
     */
    public synchronized final double getFIBER() {
	    return FIBER;
    }
}
