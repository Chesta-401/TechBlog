<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage = "error_page.jsp" %>
 <%
User user = (User)session.getAttribute("currentuser");
if(user == null){
	response.sendRedirect("login.jsp");
}

%>   
<%
 int postid = Integer.parseInt(request.getParameter("post_id"));
 PostDao d = new PostDao(ConnectionProvider.getConnection());
 Post p= d.getPostByPostId(postid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getPtitle()%> || TechBlog</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.bannerbg{ 
         clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 87%, 63% 99%, 30% 90%, 0 99%, 0 0);
}
.post-title{
font-size:30px;
font-weight:400;}

.post-content{
font-size:22px;
font-weight:370;}

.post-date{
font-style:italic;
font-weight:bold;
}

.post-user-info{
font-size:20px;

}
.row-user{
border:1px solid #e2e2e2;
padding-top: 15px}

body{
background:url(img/background.jpg);
background-size:cover;
background-attachment:fixed;
}

</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0" nonce="Y29th2RV"></script>
</head>
<body>




<!--navbar-->

<nav class="navbar navbar-expand-lg navbar-dark primary-bg">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>Learn Code with Durgesh <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-check-square-o"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-address-card-o">Contact Us</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#postmodal"><span class="fa fa-asterisk">Post</a>
      </li>
      
      
    </ul>
   
   <ul class="navbar-nav mr-right">
   		 <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle "></span><%= user.getName() %></a>
      </li>
      
       <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus "></span>Log out</a>
      </li>
     
   </ul>
  </div>
</nav>







<!-- end of navbar -->

<!-- main content of body -->


<div class= "container">
	<div class="row my-4">
		<div class="col-md-8 offset-md-2">
			
			<div class="card">
				<div class="card-header primary-bg text-white">
					<h4 class="post-title"><%= p.getPtitle() %></h4>
					
				</div>
				<div class="card-body">
					<img class="card-img-top my-2" src="blog_pics/<%=p.getPpic() %>" alt="Card image cap">
					<div class="row my-2 row-user">
						<div class="col-md-8">
							<% userdao ud = new userdao(ConnectionProvider.getConnection()); %>
							<p class="post-user-info">Posted by:<a href="#" ><%= ud.getUserByUserId(p.getUserid()).getName() %></a></p>
						</div>
						<div class="col-md-4">
							<p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getPdate())%></p>
						</div>
					</div>
					<p class="post-content"><%=p.getPcontent() %></p>
					<br>
					<br>
					<div class="post-code">
					<pre><%= p.getPcode() %></pre>
					</div>
				</div>	
				<div class= "card-footer primary-bg ">
				<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				%>
	
					<a href="#" onclick="dolike(<%= p.getPid() %>,<%= p.getUserid() %>)" class="btn btn-outline-light "><i class = "fa fa-thumbs-o-up"></i><span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %></span></a>
					<a href="#" class="btn btn-outline-light"><i class = "fa fa-commenting-o"></i><span>20</span></a>
				
				</div>
				<div class="card-footer">
					<div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blogpage.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="5"></div>
				</div>
			</div>	
		
		
		</div>
	</div>
	
</div>







<!-- end ofain content -->

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-bg text-white">
        <h5 class="modal-title" id ="exampleModalLabel" >TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class= "container text-center">
        		<img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width:150px;">
        		<br>
        		<h5 class="modal-title" id="exampleModalLabel" mt-3><%= user.getName() %></h5>
        		
        		
        		
        <div id ="profile-details">		
        		<table class="table">
					  
					 
					    <tr>
					      <th scope="row">Id :</th>
					      <td><%= user.getId() %></td>
					      
					    </tr>
					    <tr>
					      <th scope="row">Email :</th>
					      <td><%= user.getEmail() %></td>
					      
					    </tr>
					    <tr>
					      <th scope="row">Gender :</th>
					      <td><%= user.getGender() %></td>
					     
					    </tr>
					    <tr>
					      <th scope="row">About :</th>
					      <td><%= user.getAbout() %></td>
					     
					    </tr>
					    
					     <tr>
					      <th scope="row">Registered on :</th>
					      <td><%= user.getDatetime().toString() %></td>
					     
					    </tr>
					    
					  </tbody>
			</table>

	</div>
	<div id="profile-edit" style="display:none;">
	
	<h4 class="mt-2">Please edit carefully</h4>
	<form action="EditServlet" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>Id :</th>
				<td><%= user.getId() %></td>
			</tr>	
			<tr>
				<th>Email :</th>
				<td><input type = "email" class="form-control" name=" user_email" value="<%= user.getEmail() %>"></td>
			</tr>
			<tr>
				<th>Name :</th>
				<td><input type = "text" class="form-control" name=" user_name" value="<%= user.getName() %>"></td>
			</tr>
			<tr>
				<th>Password :</th>
				<td><input type = "password" class="form-control" name=" user_password" value="<%= user.getPassword() %>"></td>
			</tr>
			<tr>
				<th>Gender :</th>
				<td><%= user.getGender() %></td>
			</tr>
			<tr>
				<th>About :</th>
				<td>
				<textarea rows="3" class = "form-control" name= "user_about"><%= user.getAbout() %></textarea></td>
			</tr>
			<tr>
				<th>New Profile pic :</th>
				
				<td><input type ="file" class="form-control" name= "image"></td>
			</tr>
		
		</table>
		
		<div class="container">
		<button type="submit" class="btn btn-outline-primary">Save</button></div>
		
		
	</form>


		</div>
		        		
		        	
		        	
		        	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button id = "edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
		      </div>
		    </div>
		  </div>
		</div>

<!-- end of profile modal -->


<!-- post modal -->



				
				<!-- Modal -->
				<div class="modal fade" id="postmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <form id="addpostform" action="Addpostservlet" method="post">
				        		<div class= "form-group"> 
				        		<select class= "form-control" name="cid">
				        		<option selected disabled>---Select Category---</option>
				        		<% 
				        		PostDao pd =  new PostDao(ConnectionProvider.getConnection());
				        		ArrayList<Category> list =  pd.getCategories();
				        		for(Category c: list){
				        			%>
				        			<option value="<%= c.getCid()%>"><%= c.getName()%></option>
				        		
				        		<% }
				        		%>
				        		
				        		</select>
				        		</div>
				        		<div class="form-group" >
				        			<input name="ptitle" type="text" placeholder="Enter post Title" class= "form-control">
				        		</div>
				        		
				        		<div class="form-group" >
				        			<textarea  name="pcontent" style="height:200px;" placeholder="Enter your content" class= "form-control"></textarea>
				        		</div>
				        		
				        		<div class="form-group" >
				        			<textarea  name="pcode" style="height:200px;" placeholder="Enter your program (if any)" class= "form-control"></textarea>
				        		</div>
				        		
				        		<div class="form-group" >
				        		<label>Select your image :</label>
				        			<input  name="pic" type="file" >
				        		</div>
				        		 <div class="container text-center">
				        		<button type= "submit" class= "btn btn-outline-primary">Do Post</button>
				     			 </div>
				        
				        
				        
				        </form>
				        
				      </div>
				     
				    </div>
				  </div>
				</div>


<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjs.js" type= "text/javascript"></script>


<script>
$(document).ready(function () {

	let status = false;
	$("#edit-profile-button").click(function () {
	
		if(status == false){
			$("#profile-details").hide()
			$("#profile-edit").show();
			status= true;
			$(this).text("Back")
		} else{
			
			$("#profile-details").show()
			$("#profile-edit").hide();
			status= false;
			$(this).text("EDIT")
		}
				
	})
		
	
});

</script>


<!-- ad post js -->
<script >

$(document).ready(function (e){
	$("#addpostform").on("submit" , function (event){
		event.preventDefault();
		console.log("submittedd")
		
		let form = new FormData(this);
		$.ajax({
			url: "Addpostservlet",
			type: 'POST',
			data: form,
			success: function (data,textStatus , jqXHR){
				console.log(data);
				if(data.trim() == 'done'){
					swal("Good job!", "Saved Successfully!", "success");
				}
				else{
					swal("Error!!", "Something went wrong try again...", "error");
				}
			},
			error: function (jqXHR, textStatus, errorThrown){
				swal("Error!!", "Something went wrong try again...", "error");
			},
			
		
		processData: false,
		contentType: false
		
		
		
		
		})
	})
})



</script>

</body>
</html>