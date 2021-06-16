package com.tech.blog.servlets;


import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.Msg;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class Login_serv
 */
@WebServlet("/Login_serv")
public class Login_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try(PrintWriter out = response.getWriter()){
		String useremail= request.getParameter("email");
		String userpassword = request.getParameter("password");
	    userdao dao = new userdao(ConnectionProvider.getConnection());
	    User u =dao.getUserByEmailAndPassword(useremail, userpassword);
	    if(u == null) {
	   Msg  msg = new Msg("Invalid details... try again", "error", "alert-danger");
	   
	   
	  
	   HttpSession s = request.getSession();
	   s.setAttribute("msg", msg);
	   
	   response.sendRedirect("login.jsp");
	    	
	    }
	    else {
	    	HttpSession s = request.getSession();
	    	s.setAttribute("currentuser", u);
	    	response.sendRedirect("profile.jsp");
	    	
	    }
	    

		
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
