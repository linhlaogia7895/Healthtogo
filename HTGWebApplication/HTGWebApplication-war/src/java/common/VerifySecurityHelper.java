/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Document   : VerifySecurityHelper.java
 * Version    : Feb 15, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for verifying security
 */
public final class VerifySecurityHelper{
    
    /*Singleton*/
    private static VerifySecurityHelper obj=null;
    
    public static VerifySecurityHelper getInstance(){
	if(obj==null){
	    obj=new VerifySecurityHelper();
	    return obj;
	}else return obj;
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	boolean idMatches=false;
	HttpSession session=request.getSession(true);
	String userName=(String)session.getAttribute("userName");
	String userType=(String)session.getAttribute("userType");
	String guestID=(String)session.getAttribute("guestID");
	Cookie[] cookies=request.getCookies();
	String jsessid="";
	
	if(cookies!=null){
	    for(Cookie c: cookies){
		
		if(c.getName().equals("JSESSIONID")){
		    jsessid=c.getValue();
		    if(jsessid.equals(session.getId())){
			idMatches=true;  //turns true only when a user is logged in: verified
		    }
		}
	    }
	}
	
	boolean isLoggedIn=userName!=null && !userName.isEmpty() 
			    && userType!=null && !userType.isEmpty() 
			    && idMatches;
	boolean isGuest=guestID!=null && !guestID.isEmpty() && idMatches;
	
	if(isLoggedIn){
	    return "logged in";
	}
	else if(isGuest){
	    return "guest";
	}
	else return "unauthorized";
    }
    
    /**
     * Method to verify security
     * @return true if verified
     */
    public static boolean isLoggedIn(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	boolean verified=false;
	HttpSession session = request.getSession(true);
	String ret=processRequest(request, response);
	
	if(ret.equalsIgnoreCase("logged in")) verified=true;
	return verified;
    }
    
    /**
     * Method to verify security
     * @return true if verified
     */
    public static boolean isGuest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	boolean verified=false;
	String ret=processRequest(request, response);
	
	if(ret.equalsIgnoreCase("guest")) verified=true;
	return verified;
    }
}
