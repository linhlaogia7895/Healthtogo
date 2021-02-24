/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.patient;

import beans.users.UsersBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class SecurityBean {

    private ArrayList<String> question =  new ArrayList<>();
    private ArrayList<String> anwser =  new ArrayList<>();
    

    public SecurityBean() {
    }
    
    /**
     * constructor for SecurityBean
     * @param username the registered user name 
     * @throws NamingException when the indicated operation cannot be performed
     */
    public SecurityBean(String username) throws NamingException
    {
        try {
           
            PreparedStatement ps;
            try (Connection conn = getConnection()) {
                String sql="{call getSecurityQuestion(?)}";
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    question.add(rs.getString(1));
                    anwser.add(rs.getString(2));                    
                }
                conn.close();
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PatientBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * Method to return the list of questions
     * @return ArrayList the list of questions
     */
    public ArrayList getQuestion()
    {
        return question;
    }
    
    /**
     * Method to get the list of answers
     * @return ArrayList the list of answers
     */
    public ArrayList getAnwser()
    {
        return anwser;
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
