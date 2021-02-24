/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.users;

import java.sql.Date;

/**
 * Document   : Record.java
 * Version    : Jan 21, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for Journal
 */
public final class Record {
    private int recordNumber;
    private int patientId;
    private Date dateOfMeasurement;
    private double patientCurrentWeight;
    private double patientGoalWeight;
    private double patientStartWeight;
    private double patientLowestWeight;
    private double patientHalfWayWeight;
    private double patientWeightLost;
    private double patientCaloriesLevel;
    private double patientChestMeasure;
    private double patientWaistMeasure;
    private double patientAbdomenMeasure;
    private double patientHipMeasure;

    public Record() {
    }
    /**
     * main constructor
     * @param recordNumber
     * @param patientId
     * @param dateOfMeasurement
     * @param patientCurrentWeight
     * @param patientGoalWeight
     * @param patientStartWeight
     * @param patientLowestWeight
     * @param patientHalfWayWeight
     * @param patientWweightLost
     * @param patientCaloriesLevel
     * @param patientChestMeasure
     * @param patientWaistMeasure
     * @param patientAbdomenMeasure
     * @param patientHipMeasure 
     */
    public Record(int recordNumber, int patientId, Date dateOfMeasurement, double patientCurrentWeight, double patientGoalWeight, double patientStartWeight, double patientLowestWeight, double patientHalfWayWeight, double patientWweightLost, double patientCaloriesLevel, double patientChestMeasure, double patientWaistMeasure, double patientAbdomenMeasure, double patientHipMeasure) {
        this.recordNumber = recordNumber;
        this.patientId = patientId;
        this.dateOfMeasurement = dateOfMeasurement;
        this.patientCurrentWeight = patientCurrentWeight;
        this.patientGoalWeight = patientGoalWeight;
        this.patientStartWeight = patientStartWeight;
        this.patientLowestWeight = patientLowestWeight;
        this.patientHalfWayWeight = patientHalfWayWeight;
        this.patientWeightLost = patientWweightLost;
        this.patientCaloriesLevel = patientCaloriesLevel;
        this.patientChestMeasure = patientChestMeasure;
        this.patientWaistMeasure = patientWaistMeasure;
        this.patientAbdomenMeasure = patientAbdomenMeasure;
        this.patientHipMeasure = patientHipMeasure;
    }
    /**
     * method to get record number
     * @return recoed number
     */
    public int getRecordNumber() {
        return recordNumber;
    }
    /**
     * method to get patient id
     * @return patient id
     */
    public int getPatientId() {
        return patientId;
    }
    /**
     * method to get date
     * @return date
     */
    public Date getDateOfMeasurement() {
        return dateOfMeasurement;
    }
    /**
     * method to get current weight
     * @return current weight
     */
    public double getPatientCurrentWeight() {
        return patientCurrentWeight;
    }
    /**
     * method to get goal weight
     * @return goal weight
     */
    public double getPatientGoalWeight() {
        return patientGoalWeight;
    }
    /**
     * method to get start weight
     * @return start weight
     */
    public double getPatientStartWeight() {
        return patientStartWeight;
    }
    /**
     * method to get lowest weight
     * @return  lowest weight
     */
    public double getPatientLowestWeight() {
        return patientLowestWeight;
    }
    /**
     * method to get halfway weight
     * @return halfway weight
     */
    public double getPatientHalfWayWeight() {
        return patientHalfWayWeight;
    }
    /**
     * method to get weight lost
     * @return weight lost
     */
    public double getPatientWeightLost() {
        return patientWeightLost;
    }
    /**
     * method to get calories level
     * @return calories
     */
    public double getPatientCaloriesLevel() {
        return patientCaloriesLevel;
    }
    /**
     * method to get chest measurement
     * @return chest
     */
    public double getPatientChestMeasure() {
        return patientChestMeasure;
    }
    /**
     * method to get waist measurement
     * @return waist
     */
    public double getPatientWaistMeasure() {
        return patientWaistMeasure;
    }
    /**
     * method to get abdomen
     * @return abdomen
     */
    public double getPatientAbdomenMeasure() {
        return patientAbdomenMeasure;
    }
    /**
     * method to get hip measurement
     * @return  hip
     */
    public double getPatientHipMeasure() {
        return patientHipMeasure;
    }
}
