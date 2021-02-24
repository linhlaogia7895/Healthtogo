/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.staff;


import beans.users.UsersBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateful;
import javax.ejb.LocalBean;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Document   : SecurityBean.java
 * Version    : Jan 20, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: EJB for security
 */
@Stateful
@LocalBean
public class EditPatientByStaffBean {

private String firstName;
private String lastName;
private String email;
private String address;
private String homePhone;
private String cellPhone;
private Date dateOfBirth;
private String gender;
private String contract;
private SimpleDateFormat dateformat = new SimpleDateFormat("MM/DD/YYYY");

public EditPatientByStaffBean()
{
}

/**
 * Constructor for EditPatientByStaffBean
 * @param patientID the patient ID
 * @throws NamingException when the indicated operation cannot be performed
 */
public EditPatientByStaffBean(int patientID)throws NamingException
{
     try {
            PreparedStatement ps;
            try (Connection conn = getConnection()) {
                String sql="{call getPatientInfoById(?)}";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, patientID);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    this.firstName = rs.getString(2);
                    this.lastName = rs.getString(3);
                    this.email = rs.getString(4);
                    this.address = rs.getString(5);
                    this.homePhone = rs.getString(6);
                    this.cellPhone = rs.getString(7);
                    this.dateOfBirth = rs.getDate(8);
                    this.gender = rs.getString(9);
                    this.contract = rs.getString(10);
                    
                }
                conn.close();
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(EditPatientByStaffBean.class.getName()).log(Level.SEVERE, null, ex);
        }
}
    /**
     * Method to get the firstName
     * @return the firstName
     */
    public synchronized final String getFirstName() {
	    return firstName;
    }
    /**
     * Method to get the lastName
     * @return the lastName
     */
    public synchronized final String getLastName() {
	    return lastName;
    }
    /**
     * Method to get the email
     * @return the email
     */
    public synchronized final String getEmail() {
	    return email;
    }
    /**
     * Method to get the address
     * @return the address
     */
    public synchronized final String getAddress() {
	    return address;
    }
    /**
     * Method to get the homePhone
     * @return the homePhone
     */
    public synchronized final String getHomePhone() {
	    return homePhone;
    }
    /**
     * Method to get the cellPhone
     * @return the cellPhone
     */
    public synchronized final String getCellPhone() {
	    return cellPhone;
    }
    /**
     * Method to get the dateOfBirth
     * @return the dateOfBirth
     */
    public synchronized final Date getDateOfBirth() {
	    return dateOfBirth;
    }
    /**
     * Method to get the gender
     * @return the gender
     */
    public synchronized final String getGender() {
	    return gender;
    }
    /**
     * Method to get the contract
     * @return the contract
     */
    public synchronized final String getContract() {
	    return contract;
    }
  /**
     * Private method to manage connections to jdbc
     * @return Connection the jdbc connection
     */
    private Connection getConnection() throws NamingException {
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            InitialContext ic=new InitialContext();
            DataSource ds=(DataSource)ic.lookup("jdbc/htgConnectionPool");
            conn=ds.getConnection();
        } catch (ClassNotFoundException | NamingException | SQLException ex) {
            Logger.getLogger(UsersBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
}

