package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.DBConnection;

@WebServlet("/perticipateServ")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class perticipateServ extends HttpServlet {
    /*
     create images folder at, C:\Users\PC Name\Documents\NetBeansProjects\ImageProject\build\web\images
     */

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String userId = request.getParameter("userName");
		String competitionId = request.getParameter("competitionId");
		String mobile = request.getParameter("mobile");
		String designation = request.getParameter("designation");
		String pictureId = request.getParameter("pictureId");
		String comment = request.getParameter("comment");
		
        Part part = request.getPart("picture");//
        String fileName = extractFileName(part);//file name
        System.out.println("fileName:"+fileName);//wait
        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath+ UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            conn = DBConnection.createConnection();
            String sql = "insert into tbl_competitor(competitorId,competitionId,mobile,designation,picture,pictureId,comments) values (?,?,?,?,?,?,?)";
			
			//String sql = "insert into tbl_books(Books_Id,Department,Year,Semister,Books_Type,Books_Name,Publishers,Book_File) values(?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, competitionId);
			pst.setString(3, mobile);
			pst.setString(4, designation);
			pst.setString(5, dbFileName);
			pst.setString(6, pictureId);
			pst.setString(7, comment);
            int i = pst.executeUpdate();
            if(i!=0) {
            	out.println("<center><h1>Information inserted Succesfully......</h1></center>");
            	request.getRequestDispatcher("perticipate.jsp").forward(request, response);
            }
            else {
            	out.println("<center><h1>Information not inserted Succesfully......</h1></center>");
            }
            
            //out.println("<center><a href='display.jsp?id=" + id + "'>Display</a></center>");
        } catch (Exception e) {
            out.println(e);
        }
        
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
