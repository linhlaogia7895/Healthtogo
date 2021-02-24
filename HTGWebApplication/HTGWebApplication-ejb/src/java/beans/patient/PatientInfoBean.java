/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.patient;

import beans.users.UsersBean;
import domains.patient.PatientInfoDomain;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.ConcurrencyManagementType;
import javax.ejb.Stateful;
import javax.ejb.LocalBean;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Singleton;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Document   : PatientInfoBean.java
 * Version    : Jan 20, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: EJB for patient info
 */
@ConcurrencyManagement(ConcurrencyManagementType.CONTAINER)
@Singleton
public class PatientInfoBean {

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
    
    /**
     * Method to get the patient info
     * @param username the registered user name
     * @return ArrayList the list containing the patient info
     */
    @Lock(LockType.READ)
    public PatientInfoDomain getPatientInfo(String username){
	PreparedStatement ps=null;
	ResultSet rs=null;
	PatientInfoDomain pif;
	try {
	    try (Connection conn = getConnection()) {
		String sql="{call GetPatientInfo(?)}";
		ps=conn.prepareStatement(sql);
		ps.setString(1, username);
		rs=ps.executeQuery();
		rs.next();
		pif=PatientInfoDomain.getInstance(rs.getInt(1) != 0? rs.getInt(1):0,
						rs.getString(2) != null? rs.getString(2):"",
						rs.getString(3) != null? rs.getString(3):"",
						rs.getString(4) != null? rs.getString(4):"",
						rs.getString(5) != null? rs.getString(5):"",
						rs.getString(6) != null? rs.getString(6):"",
						rs.getString(7) != null? rs.getString(7):"",
						rs.getDate(8),
						rs.getString(9) != null? rs.getString(9).charAt(0):'N',
						rs.getString(10) != null? rs.getString(10):"",
						rs.getString(11) != null? rs.getString(11):"",
						rs.getInt(12),
						rs.getString(13) != null? rs.getString(13):"");
		conn.close();
	    }

	    return pif;

	} catch (NamingException | SQLException ex) {
	    Logger.getLogger(PatientInfoBean.class.getName()).log(Level.SEVERE, null, ex);
	}finally{
	    try {
		rs.close();
		ps.close();
	    } catch (SQLException ex) {
		Logger.getLogger(PatientInfoBean.class.getName()).log(Level.SEVERE, null, ex);
	    }
	}
	return null;
    }
}