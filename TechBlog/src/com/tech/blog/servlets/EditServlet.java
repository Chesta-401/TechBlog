package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.Msg;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out = response.getWriter()){
			
			String useremail =  request.getParameter("user_email");
			String username =  request.getParameter("user_name");
			String userpassword =  request.getParameter("user_password");
			String userabout =  request.getParameter("user_about");
			Part part =  request.getPart("image");
			String imagename =  part.getSubmittedFileName();
			
			HttpSession s= request.getSession();
			User user =(User) s.getAttribute("currentuser");
			
			user.setEmail(useremail);
			user.setName(username);
			user.setPassword(userpassword);
			user.setAbout(userabout);
			String oldfile = user.getProfile();
			user.setProfile(imagename);
			
			userdao ud = new userdao(ConnectionProvider.getConnection());
			boolean a =ud.UpdateUser(user);
			if(a) {
				
				String oldpath = request.getRealPath("/") + "pics" + File.separator + oldfile;
				
				String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
				
				if(!oldfile.equals("default.png")) {
				Helper.deleteFile(oldpath);}
								
					if(Helper.saveFile(part.getInputStream(), path)){
						out.println("updated");
						
						 Msg  msg = new Msg("Profile details Updated...", "success", "alert-success");
						   
						   
						  
						  
						   s.setAttribute("msg", msg);
						   
					} 
									
					
					
						   
						  
						
						
					}
						
			
		else {
				Msg  msg = new Msg("Something went wrong....", "error", "alert-danger");
				   
				   s.setAttribute("msg", msg);
				   
				  
				
			}
			 response.sendRedirect("profile.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
