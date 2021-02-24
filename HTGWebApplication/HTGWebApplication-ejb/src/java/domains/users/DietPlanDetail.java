/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.users;

/**
 * Document   : DietPlanDetail.java
 * Version    : Jan 21, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for diet plan
 */
public final class DietPlanDetail {
    private final int detailNumber;
    private final int dietPlanNumber;
    private final String day;
    private final String breakfast;
    private final String lunch;
    private final String dinner;
    private final String morningSnack;
    private final String afternoonSnack;
    /**
     * main constructor
     * @param detailNumber
     * @param dietPlanNumber
     * @param day
     * @param breakfast
     * @param lunch
     * @param dinner
     * @param morningSnack
     * @param afternoonSnack 
     */
    private DietPlanDetail(int detailNumber, 
			    int dietPlanNumber, 
			    String day, 
			    String breakfast, 
			    String lunch, 
			    String dinner, 
			    String morningSnack, 
			    String afternoonSnack) {
	
        this.detailNumber = detailNumber;
        this.dietPlanNumber = dietPlanNumber;
        this.day = day;
        this.breakfast = breakfast;
        this.lunch = lunch;
        this.dinner = dinner;
        this.morningSnack = morningSnack;
        this.afternoonSnack = afternoonSnack;
    }
    
    private static DietPlanDetail obj=null;
    
    public static synchronized DietPlanDetail getInstance(int detailNumber, 
							int dietPlanNumber, 
							String day, 
							String breakfast, 
							String lunch, 
							String dinner, 
							String morningSnack, 
							String afternoonSnack){
	if(obj==null){
	    obj=new DietPlanDetail(detailNumber, 
				    dietPlanNumber, 
				    day, 
				    breakfast, 
				    lunch, 
				    dinner, 
				    morningSnack, 
				    afternoonSnack);
	    return obj;
	}else{
	    return obj;
	}
    }

    /**
     * Method to get the detailNumber
     * @return the detailNumber
     */
    public synchronized final int getDetailNumber() {
	    return detailNumber;
    }
    /**
     * Method to get the dietPlanNumber
     * @return the dietPlanNumber
     */
    public synchronized final int getDietPlanNumber() {
	    return dietPlanNumber;
    }
    /**
     * Method to get the day
     * @return the day
     */
    public synchronized final String getDay() {
	    return day;
    }
    /**
     * Method to get the breakfast
     * @return the breakfast
     */
    public synchronized final String getBreakfast() {
	    return breakfast;
    }
    /**
     * Method to get the lunch
     * @return the lunch
     */
    public synchronized final String getLunch() {
	    return lunch;
    }
    /**
     * Method to get the dinner
     * @return the dinner
     */
    public synchronized final String getDinner() {
	    return dinner;
    }
    /**
     * Method to get the morningSnack
     * @return the morningSnack
     */
    public synchronized final String getMorningSnack() {
	    return morningSnack;
    }
    /**
     * Method to get the afternoonSnack
     * @return the afternoonSnack
     */
    public synchronized final String getAfternoonSnack() {
	    return afternoonSnack;
    }
}