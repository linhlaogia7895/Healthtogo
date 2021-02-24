package users;

import beans.users.UsersBean;
import common.HtmlPageHelper;
import java.io.IOException;
import java.io.PrintWriter;
import static java.util.Objects.hash;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Document   : MainPageServlet.java
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for main page
 */
public class UsersServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	
        /*logout*/
        String logout=request.getParameter("logout");
        if(logout!=null){
	    
	    HttpSession session = request.getSession(true);
	    HtmlPageHelper hph=HtmlPageHelper.getInstance();
	    
	    session.setAttribute("userName", null);
	    session.setAttribute("userType", null);
	    
	    session.setAttribute("guestID", session.getAttribute("nonce"));
	    
	    session.invalidate();
	    session=request.getSession(false);
            request.setAttribute("message", hph.sendMessage("You are now logged out..."));
            request.setAttribute("classRequireLogin", "class='require-login'");      
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	    response.setDateHeader("Expires", 0); // Proxies.
	    
	    response.sendRedirect("MainPageServlet");
        }
        
        /*verifies that a login request is submitted*/
        String submitLogin=request.getParameter("submitLogin");
        if(submitLogin!=null){
            
	    HtmlPageHelper hph=HtmlPageHelper.getInstance();
	    HttpSession session = request.getSession(true);
	    UsersBean ub=new UsersBean();
	    
            /*verifies that all parameters for login request are supplied*/
            String userName=request.getParameter("userName");
            String password=request.getParameter("password");
            userName = userName.replaceAll("'","\"");
            password = password.replaceAll("'","\"");
            int hashPassword = hash(password);
            boolean hasLogin=userName!=null && !userName.isEmpty() && password!=null && !password.isEmpty();
            if(hasLogin){
                
                /*checks if user is a valid user*/
                if(checkUser(userName, Integer.toString(hashPassword))){
		    
                    /*Note: retrieves the user type for the logged in user*/
                    
                    /*sets username as session attribute. When invalidated, user should be logged out*/
                    session.setAttribute("userName", userName);
                    
                    /*sets usertype as session attribute. Useful when redirecting back to user's JSP after an operation*/
                    session.setAttribute("userType", ub.userGetType(userName));
		    
		    /*if userType != null, then set guest session to null*/
		    session.setAttribute("guestID", null);
		    
		    /*creates a nonce for additional security verification*/
		    String nonce=UUID.randomUUID().toString();
		    session.setAttribute("nonce", nonce);
		    
//		    session.setAttribute("userPageLink", userPageUrl((String)session.getAttribute("userType")));
//		    System.err.println("userPageLink: "+session.getAttribute("userPageLink"));
                    
                    /*if remember-me-login is checked off, sets rememberMe as session attribute. 
                    Can be used for user's other transactions that need the rememberMe value*/
                    String rememberMeLogin=(String)request.getParameter("remember-me-login");
                    if(rememberMeLogin!=null)
                        session.setAttribute("rememberMe", rememberMeLogin);
                        
                    /*redirects to the appropriate JSP page*/
                    String userType=(String)request.getSession().getAttribute("userType");
                    
                    
                    /*Unimplemented: create a log entry for login*/
                    
                    hph.setNavBarElements(userType,request);
                    redirectToUserJSP(userType,request,response,session);
                }else{
                    
                    /*when username and/or password are/is invalid*/
                    request.setAttribute("message", hph.sendMessage("Invalid username or password"));
                    request.setAttribute("classRequireLogin", "class='require-login'");
                    hph.setNavBarElements("",request); //"" = no userType, so defaults settings
                    redirectToUserJSP("",request,response,session); //"" = no userType, so defaults to index.jsp
                }
            }else{
                /*when not both username and password were entered*/
                request.setAttribute("message", hph.sendMessage("Both values are required"));
                request.setAttribute("classRequireLogin", "class='require-login'");
                hph.setNavBarElements("",request); //"" = no userType, so defaults settings
                redirectToUserJSP("",request,response,session); //"" = no userType, so defaults to index.jsp
            } 
        }
	
	/*sign up*/
        String submitSignUp = request.getParameter("submitSignUp");
        if(submitSignUp != null)
        {
	    HttpSession session = request.getSession(true);
	    HtmlPageHelper hph=HtmlPageHelper.getInstance();
	    UsersBean ub=new UsersBean();
	    
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            username = username.replaceAll("'","\"");
            password = password.replaceAll("'","\"");
            int hashPassword = hash(password);
            boolean checkUsername = ub.userExists(username);
            if(checkUsername)
            {
                request.setAttribute("message", hph.sendMessage("Username Existed"));
                redirectToUserJSP("",request,response,session);
            }
            else
            {
                if(ub.userAdd(username, username, Integer.toString(hashPassword), "patient", false))
                {
                    request.setAttribute("message", hph.sendMessage("Welcome " +username+", Please edit your profile."));
                    session.setAttribute("userName", username);
                    session.setAttribute("userType", ub.userGetType(username));
                    /*if userType != null, then set guest session to null*/
		    session.setAttribute("guestID", null);
		    
		    /*creates a nonce for additional security verification*/
		    String nonce=UUID.randomUUID().toString();
		    session.setAttribute("nonce", nonce);
		    
		    session.setAttribute("userPageLink", userPageUrl((String)session.getAttribute("userType")));
                    String userType=(String)request.getSession().getAttribute("userType");
                    hph.setNavBarElements(userType,request);
                    getServletContext().getRequestDispatcher("/patientEditProfileWhenSignUp.jsp").forward(request, response);
                }
                else
                {
                    request.setAttribute("message", hph.sendMessage("Error Signing Up, Please Try Again Later"));
                    redirectToUserJSP("",request,response,session);
                }
            }
        }
        String submitPatientExist = request.getParameter("submitPatientExist");
        
        if(submitPatientExist != null)
        {
            HttpSession session = request.getSession(true);
             HtmlPageHelper hph=HtmlPageHelper.getInstance();
	     UsersBean ub=new UsersBean();
	    
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean checkUsername = ub.userExists(username);
            if(checkUsername)
            {
                request.setAttribute("message", hph.sendMessage("Username already exist!!!"));
                redirectToUserJSP("",request,response,session);
            }
            else
            {
                if(ub.userAdd(username, username, password, "patient", false))
                {
                    request.setAttribute("message", hph.sendMessage("Welcome " +username+", Please edit your profile."));
                    request.getSession().setAttribute("userName", username);
                    request.getSession().setAttribute("userType", ub.userGetType(username));
                    String userType=(String)request.getSession().getAttribute("userType");
                    hph.setNavBarElements(userType,request);
                    getServletContext().getRequestDispatcher("/createPatientAccountByStaff.jsp").forward(request, response);
                }
                else
                {
                    request.setAttribute("message", hph.sendMessage("Error,Unable to create patient logins"));
                    redirectToUserJSP("",request,response,session);
                }
            }
            
        }
	
	//response.sendRedirect("MainPageServlet");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    /**
     * Method to validate user
     * @param username the username entered
     * @param password the password entered
     * @return true if validated
     */
    private boolean checkUser(String username, String password){
        UsersBean ub=new UsersBean();
        return ub.userValidate(username, password);
    }
    
    /**
     * Method for redirect
     * @param userType the user's userType
     * @param request an HttpServletRequest object
     * @param response an HttpServletResponse object
     */
    private void redirectToUserJSP(String userType, HttpServletRequest request,HttpServletResponse response, HttpSession session){
        String url="";
	
	session=request.getSession(false);
        
        /*sets the user URL*/
        try {
            switch(userType){
                case "admin":
                    url="/admin.jsp";
                    break;
                case "nutritionist":
                    url="/nutritionist.jsp";
                    break;
                case "staff":
                    url="/staff.jsp";
                    break;
                case "patient":
                    url="/patient.jsp";
                    break;
                default:
                    url="/index.jsp";
            }
	    
            getServletContext().getRequestDispatcher(url).forward(request, response);
            
        } catch (IOException ex) {
            Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ServletException ex) {
            Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private String userPageUrl(String user){
	String url="";
	
	switch(user.toLowerCase()){
	    case "admin":
		url="MainPageServlet?page=admin";
		break;
	    case "nutritionist":
		url="MainPageServlet?page=nutritionist";
		break;
	    case "staff":
		url="MainPageServlet?page=staff";
		break;
	    default:
		url="";
		break;
	}
	return url;
    }
}
