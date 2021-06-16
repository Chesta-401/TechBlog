package com.tech.blog.servlets;

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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class Addpostservlet
 */
@WebServlet("/Addpostservlet")
@MultipartConfig
public class Addpostservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addpostservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try(PrintWriter out = response.getWriter()){
		int id = Integer.parseInt(request.getParameter("cid"));
		String title= request.getParameter("ptitle");
		String content =  request.getParameter("pcontent");
		String code =  request.getParameter("pcode");
		Part part =  request.getPart("pic");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentuser");
		user.getId();
		//out.println("your post title is" + title);
		//out.println(part.getSubmittedFileName());
		
		Post p = new Post( title, content, code, part.getSubmittedFileName(), null, id, user.getId());
		PostDao dao = new PostDao(ConnectionProvider.getConnection()) ;
		if(dao.savePost(p)) {
			out.println("done");
		}else {
			out.println("error");
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
