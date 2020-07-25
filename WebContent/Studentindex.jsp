<%@ page import="myPack.*" import="java.io.*" import="java.sql.*" import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VClassroom</title>
<!--Additional CSS-->
<link rel="stylesheet" href="css/style.css" />
<!--Complete CSS-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--Complete JavaScript-->
<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!--Complete JavaScript Bundle-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
String msg=(String)request.getParameter("msg");   // Success messages of post
if(msg!=null)
{      
	if(msg.equals("replySuccess"))
	{
		out.print("Your Answer has been posted...");
	}
}
%>
<%
	UserModel user = (UserModel)session.getAttribute("currentSessionUser"); // Strore value from session object in a refrence variable
%>
</head>
<body>

<div class="container-fluid header primary_font navbar-fixed-top">
<nav class="navbar">
  <div class="container">
  	<div class="navbar-header">
      <a class="navbar-brand" href="Studentindex.jsp">VClassroom</a>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynavbar">
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      	</button>
      	</div>
      	<div class="collapse navbar-collapse" id="mynavbar">
        <ul class="nav navbar-nav navbar-right">
        <%
        	if(user!=null)
        	{
        		%>
    
          <li class="active"><a href="Studentindex.jsp">Home</a></li>
          <li><a href="StudentChatLogin.jsp">ChatRoom</a></li>
          <li><a href="StudentNotes.jsp">Notes</a></li>
          <li><a href="post.jsp">Ask a Question</a></li>
		<li><a href="Discussion.jsp">Discussion</a></li>
          <li><a href="userProfile.jsp">Profile</a></li>
          <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
        		<%
        	}
        	else
        	{
        		%>
        		<li><a href="Login.jsp">Login</a></li>
                <li><a href="Signup.jsp">Sign up</a></li>
                <%
        	}
        %>
        </ul>
  </div>
  </div>
</nav>
</div>
<div class="container ">
<div class="row body">
    <div class="col-lg-2">
   
       <div class="affix left_panel">
       
        <%
          if(user!=null)
		{
        	  %>
        	  
           <div class="padding-top-10">
			<%=user.getUserName()%>
			
           
        </div>
			<%
		}
        %>
        </div>
    </div>
    
     <div class="col-lg-10">
     	<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="img\Java.jpg" alt="java" class="img-rounded">
      <div class="caption">
        <h3>Java</h3>
        <p>Java is a general-purpose programming language that is class-based,
         object-oriented, and specifically designed to have as few implementation dependencies as possible. 
         Wikipedia Designed by: James Gosling
		Latest release: Java 10 (March 20, 2018)
		Platforms: Solaris, Linux, Macintosh</p>
        <p><a href="Java.jsp" class="btn btn-primary" role="button">Start </a> </p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="img\html.png" width="159px" height="283px" alt="html" class="img-rounded">
      <div class="caption">
        <h3>HTML</h3>
        <p>Hypertext Markup Language is the standard markup language for
         creating web pages and web applications. With Cascading Style Sheets and JavaScript
         , it forms a triad of cornerstone technologies for the World Wide Web. Wikipedia
	Type of format: Document file format
	</p>
        <p><a href="#" class="btn btn-primary" role="button">Start</a> </p>
      </div>
    </div>
  </div>
   <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="img\c.png" width="159px" alt="c" class="img-rounded">
      <div class="caption">
        <h3>C </h3>
        <p>C is a general-purpose, imperative computer programming language,
         supporting structured programming, lexical variable scope and recursion,
          while a static type system prevents many unintended operations. Wikipedia	
Designed by: Dennis Ritchie</p>
        <p><a href="#" class="btn btn-primary" role="button">Start</a> </p>
      </div>
    </div>
  </div>
 </div>
     </div>
</body>
</html>
