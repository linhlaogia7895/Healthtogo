/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.main;

/**
 * Document   : FoodCalories.java
 * Version    : Feb 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: domain class for jdbc Nutrition calorie table
 */
public class FoodCalories {
    private int id;
    private String foodName;
    private double recommendedCalories;
    private double calories;
    private double protein;
    private double fat;
    private double carbs;
    private double fiber;

    public FoodCalories() {
    }

    public FoodCalories(int id, String foodName, double recommendedCalories, double calories, double protein, double fat, double carbs, double fiber) {
	this.id = id;
	this.foodName = foodName;
	this.recommendedCalories = recommendedCalories;
	this.calories = calories;
	this.protein = protein;
	this.fat = fat;
	this.carbs = carbs;
	this.fiber = fiber;
    }

    public int getId() {
	return id;
    }

    public String getFoodName() {
	return foodName;
    }

    public double getRecommendedCalories() {
	return recommendedCalories;
    }

    public double getCalories() {
	return calories;
    }

    public double getProtein() {
	return protein;
    }

    public double getFat() {
	return fat;
    }

    public double getCarbs() {
	return carbs;
    }

    public double getFiber() {
	return fiber;
    }
}