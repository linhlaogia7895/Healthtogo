/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domains.users;

import java.sql.Date;

/**
 * Document   : Journal.java
 * Version    : Jan 21, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: entity class using Singleton for Journal
 */
public final class Invoice {

    private  int invoiceNumber;
    private  int patientId;
    private  Date dateInvoice;
    private  double subTotal;
    private  double taxRate;
    private  double taxAmount;
    private  double total;
    private  String billAddress;
    private  String description;
    private  Date dueDate;
    private  String status;
/**
 * Constructor method
 * @param invoiceNumber
 * @param patientId
 * @param dateInvoice
 * @param subTotal
 * @param taxRate
 * @param taxAmount
 * @param total
 * @param billAddress
 * @param description
 * @param dueDate
 * @param status 
 */
    private Invoice(int invoiceNumber, int patientId, Date dateInvoice, double subTotal, double taxRate, double taxAmount, double total, String billAddress, String description, Date dueDate, String status) {
        this.invoiceNumber = invoiceNumber;
        this.patientId = patientId;
        this.dateInvoice = dateInvoice;
        this.subTotal = subTotal;
        this.taxRate = taxRate;
        this.taxAmount = taxAmount;
        this.total = total;
        this.billAddress = billAddress;
        this.description = description;
        this.dueDate = dueDate;
        this.status = status;
    }

    
    private static Invoice obj=null;
    /**
     * getInstance method allow object to create from outside class
     * @param invoiceNumber
     * @param patientId
     * @param dateInvoice
     * @param subTotal
     * @param taxRate
     * @param taxAmount
     * @param total
     * @param billAddress
     * @param description
     * @param dueDate
     * @param status
     * @return 
     */
    public static synchronized Invoice getInstance(int invoiceNumber, int patientId, Date dateInvoice, double subTotal, double taxRate, double taxAmount, double total, String billAddress, String description, Date dueDate, String status) {
        obj=new Invoice(invoiceNumber,
                        patientId,
                        dateInvoice, 
                        subTotal, 
                        taxRate, 
                        taxAmount, 
                        total, 
                        billAddress, 
                        description, 
                        dueDate, 
                        status);
        return obj;
    }
    /**
     * getter method to get invoice number
     * @return invoice number
     */
    public int getInvoiceNumber() {
        return invoiceNumber;
    }
    /**
     * getter method to get patient id
     * @return patient id
     */
    public int getPatientId() {
        return patientId;
    }
    /**
     * getter method to get invoice date
     * @return invoice date
     */
    public Date getDateInvoice() {
        return dateInvoice;
    }
    /**
     * getter method to get sub total
     * @return sub total
     */
    public double getSubTotal() {
        return subTotal;
    }
    /**
     * getter method to get tax rate
     * @return tax rate
     */
    public double getTaxRate() {
        return taxRate;
    }
    /**
     * getter method to get tax amount
     * @return tax amount
     */
    public double getTaxAmount() {
        return taxAmount;
    }
    /**
     * getter method to get total
     * @return total
     */
    public double getTotal() {
        return total;
    }
    /**
     * getter method to get bill address
     * @return bill address
     */
    public String getBillAddress() {
        return billAddress;
    }
    /**
     * getter method to get invoice description
     * @return description
     */
    public String getDescription() {
        return description;
    }
    /**
     * getter method to get due date
     * @return due date
     */
    public Date getDueDate() {
        return dueDate;
    }
    /**
     * getter method to get invoice status
     * @return status
     */
    public String getStatus() {
        return status;
    }   
}
    
        