<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class= "row">



<% 
User uu = (User)session.getAttribute("currentuser");
PostDao pd = new PostDao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("catid"));
List<Post> l=null;
if(cid==0){
 l = pd.getAllPosts();	
}
else{
	l= pd.getPostByCatId(cid);
}


if(l.size()==0){
	out.println("<h4 class='display-3 text-center'>No posts in this category...</h4>");
}





for(Post p:l){
	%>
	<div class="col-md-6 mt-2">
	<div class="card">
	 <img class="card-img-top" src="blog_pics/<%=p.getPpic() %>" alt="Card image cap">
	<div class="card-body">
	<b><%= p.getPtitle() %></b>
	<p><%= p.getPcontent() %></p>
	
	
	
	</div>
	<div class= "card-footer primary-bg text-center">
	<%
	LikeDao ld= new LikeDao(ConnectionProvider.getConnection());
	%>
	
	<span style="color:white;"><i class = "fa fa-thumbs-o-up"></i><span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %>   </span></span>
	<a href="show_blogpage.jsp?post_id=<%= p.getPid() %> " class="btn btn-outline-light">Read More...</a>
	<a href="#" class="btn btn-outline-light"><i class = "fa fa-commenting-o"></i><span>20</span></a>
	</div>
	</div>
	</div>
	<%
}
%>