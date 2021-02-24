package main;

import common.HtmlPageHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Document   : MainPageServlet.js
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for main page
 */
public final class MainPageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected final void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	
	HttpSession session=request.getSession(true);
	HtmlPageHelper hph=HtmlPageHelper.getInstance();
        String url="/index.jsp";
	
	String guestID=UUID.randomUUID().toString();
	session.setAttribute("guestID", guestID);
	
	/*determines which JSP page to load. Parameters come from the navbar userlink*/
	String navbarUser=request.getParameter("navbarUser");

	/*determines which JSP page to load. Parameters come from the different JSP page headers*/
	String notAuthorized=request.getParameter("notAuthorized");
	if(notAuthorized!=null){
	    url=getFullPath(notAuthorized);
	}
	
        /*determines which JSP page to load. Parameters come from the navbar items*/
        String pageSection = request.getParameter("page");
        if(pageSection!=null){
            url=parsePath(pageSection);
        }
        
        /*retrieves the session scoped usertype*/
        String userType = (String)session.getAttribute("userType");
        if(userType==null){
            
            hph.setNavBarElements("", request); //userType=""
            
            /*makes the menu items under account restricted before login*/
            session.setAttribute("classRequireLogin", "class='require-login'");
            
        }else{
            
            hph.setNavBarElements(userType, request);
        }
        
//	request.getSession(false);
        getServletContext().getRequestDispatcher(url).forward(request, response);
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
    protected final void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected final void doPost(HttpServletRequest request, HttpServletResponse response)
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
     * Method to get the full path of the returned path parameter value
     * @param pathValue the path parameter value
     * @return String the full path returned
     */
    private final String getFullPath(String pathValue){
	
	String returnValue="";
		
	switch(pathValue){
	    case "adverts":
		returnValue="/adverts-all.jsp";
		break;
	    case "main":
		returnValue="/index.jsp";
		break;
	    case "nlibrary":
		returnValue="/nutrition-library.jsp";
		break;
	    case "message-nutritionist":
		returnValue="/messageToNutritionist.jsp";
		break;
	}
	
	return returnValue;
    }
    
    /**
     * Method to parse the page path coming from response.sendRedirect of the JSPs
     * @param path the path to parse
     * @return String the parsed path
     */
    private final String parsePath(String path){
	String parsed="";
	
	if(path.contains("#")){
	    String[] line = path.split("#");
	    line[0]=line[0]+".jsp";
	    parsed="/"+line[0]+line[1];
	}else
	    parsed="/"+path+".jsp";
	
	return parsed;
    }
}
