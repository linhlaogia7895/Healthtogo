/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Document   : CareerFileUploadServlet.java
 * Version    : March 1, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Servlet for uploading resumes
 */
public class CareerFileUploadServlet extends HttpServlet {

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
	
	String errorMsg=writeFile(request);
	String json = null;
	if(!errorMsg.isEmpty()) json = new Gson().toJson(new Parser(errorMsg,null));
	else json = new Gson().toJson("");
	
	PrintWriter out=response.getWriter();
	response.setCharacterEncoding("UTF-8");
	out.print(json);
	out.flush();
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
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
	
	/*To know what's in the header, uncomment this*/
//        System.out.println("content-disposition header= "+contentDisp);

        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                
                String tken=token.substring(token.indexOf("=") + 2, token.length()-1);
                return tken;
            }
        }
        return "";
    }
    
    /**
     * Method to write file from http into save folder in the server
     * @param request The http request containing the file
     * @return String the error message in case the wrong file has been attached
     */
    private String writeFile(HttpServletRequest request){
	HttpSession session=request.getSession(true);
	String errorMsg="";
	try {
	    
	    /*constructs path of the directory to save uploaded file
	    How this path is used? This same path is registered in web.xml 'location' under multipart-config.
	    Whenever a file is uploaded, the app looks to web.xml for the path. IF the path is nonexistent you
	    get an exception. This is the reason for below. It creates the subdirectories for the path*/
	    String root=File.listRoots()[0].getAbsolutePath(); /*determines the root drive letter, ex. C:*/
	    String uploadFilePath = "HTGWebApplications/uploads/career/";
	    String[] dir=uploadFilePath.split("/");
	    String rt=root;
	    for(String d:dir){
		rt+=File.separator+d;
		File saveDir=new File(rt);
		if(!saveDir.exists()){
		    saveDir.mkdirs();
		}
	    }
	    
	    int foundCounter=0;
	    /*Get all the parts from request and write it to the file on server*/
	    for (Part part : request.getParts()) {
		
		String fileName = getFileName(part);
		String fileNameExt="";
		if(fileName.toLowerCase().contains(".")) fileNameExt=fileName.substring(fileName.lastIndexOf("."));
		
		if(fileNameExt.equalsIgnoreCase(".txt") 
			|| fileNameExt.equalsIgnoreCase(".docx") 
			|| fileNameExt.equalsIgnoreCase(".pdf")){
		    
		    part.write(File.separator + fileName);
		    
		    session.setAttribute("uploadedFile", fileName);
		    session=request.getSession(false);
		    foundCounter++;
		}
	    }
	    if(foundCounter<1) errorMsg="Only .txt, .pdf and .doc files are allowed!!!";
	    
	    return errorMsg;
	} catch (IOException ex) {
	    Logger.getLogger(AdvertsCareerClientSideServlet.class.getName()).log(Level.SEVERE, null, ex);
	} catch (ServletException ex) {
	    Logger.getLogger(AdvertsCareerClientSideServlet.class.getName()).log(Level.SEVERE, null, ex);
	}
	return "";
    }
    
    /**
     * Class specifically for preparing an object for JSON
     */
    private class Parser{
	
	String error;
	String[] errorkeys;
	
	protected Parser(String error,String[] errorkeys){
	    this.error=error;
	    this.errorkeys=errorkeys;
	}
    }
}
