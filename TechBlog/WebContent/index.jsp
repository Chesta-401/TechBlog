<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.bannerbg{ 
         clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 87%, 63% 99%, 30% 90%, 0 99%, 0 0);
}
</style>
</head>
<body>
<%@include file="normal_navbar.jsp" %>
<div class="container-fluid p-0 m-0">

<div class="jumbotron primary-bg text-white bannerbg" >
<div class = "container">
<h3 class= "display-3">Welcome to Tech Blog</h3>

<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms. </p>
<p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>


<button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start! its Free</button>
<a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
</div>
</div></div>

<br>
<div class="container">
<div class="row mb-2">
<div class="col-md-4"> 

<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on.</p>
    <a href="login.jsp" class="btn primary-bg text-white">Read more...</a>
  </div>
</div>
</div>


<div class="col-md-4"> 

<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title">Python Programming</h5>
    <p class="card-text">Python is an easy to learn, powerful programming language. It has efficient high-level data structures and a simple but effective approach to object-oriented programming.</p>
    <a href="login.jsp" class="btn primary-bg text-white">Read more...</a>
  </div>
</div>
</div>

<div class="col-md-4"> 

<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title">SQL</h5>
    <p class="card-text">SQL stands for Structured Query Language. It is used for storing and managing data in relational database management system (RDMS). It is a standard language for Relational Database System. It enables a user to create, read, update and delete relational databases and tables.</p>
    <a href="login.jsp" class="btn primary-bg text-white">Read more...</a>
  </div>
</div>
</div>

</div>

<div class="row">
<div class="col-md-4"> 

<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title">C Programming</h5>
    <p class="card-text">The main features of C language include low-level access to memory, a simple set of keywords, and a clean style, these features make C language suitable for system programmings like an operating system or compiler development.</p>
    <a href="login.jsp" class="btn primary-bg text-white">Read more...</a>
  </div>
</div>
</div>


<div class="col-md-4"> 

<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title">JavaScript</h5>
    <p class="card-text">JavaScript is a cross-platform, object-oriented scripting language used to make webpages interactive (e.g., having complex animations, clickable buttons, popup menus, etc.). There are also more advanced server side versions of JavaScript such as Node.</p>
    <a href="login.jsp" class="btn primary-bg text-white">Read more...</a>
  </div>
</div>
</div>

<div class="col-md-4"> 

<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title">Data Structures and Algorithms</h5>
    <p class="card-text">Data Structure is a way of collecting and organising data in such a way that we can perform operations on these data in an effective way. Data Structures is about rendering data elements in terms of some relationship, for better organization and storage.</p>
    <a href="login.jsp" class="btn primary-bg text-white">Read more...</a>
  </div>
</div>
</div>
</div>

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
<script src="js/myjs.js"type= "text/javascript"></script>
</body>
</html>
