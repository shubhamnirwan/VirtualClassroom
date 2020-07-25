<%@ page import="myPack.*" import="java.io.*" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VClassroom - Login</title>
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
	String message=(String)request.getParameter("msg");
%>

</head>
<body>
<div class="container-fluid header primary_font navbar-fixed-top">
<nav class="navbar">
  <div class="container">
		<div class="navbar-header">
	      <a class="navbar-brand" href="index.jsp">VClassroom</a>
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynavbar">
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
      	</button>
      	</div>
      	<div class="collapse navbar-collapse" id="mynavbar">
        <ul class="nav navbar-nav navbar-right">
	          <li><a href="Signup.jsp">Signup</a></li>
	        </ul>
 		 </div>
  </div>
</nav>
</div>

<div class="container-fluid  background_image">
<div class="container">
<div class="row">
    <div class="col-lg-6">
    <div class="msg">
    <%
   	if(message!=null)
   	{
   	 if(message.equals("error"))
  	{
  		out.println("All fields are Madatory");
  	}
   	 
   	 else if(message.equals("notcorrectdetails"))
  	{
  		out.println("user id and password are wrong");
  	}
   	 else if(message.equals("loginAgain"))
  	{
  		out.println("Session ended, Login to continue...");
  	}
   	}
	%>
	</div>
    </div>
    <div class="col-lg-6">
	    <div class="login-content login_module">
	    	<div class="tabSwitch">
		    	<span class="tablinks active" onclick="openCity(event, 'userlogin')"><strong>Student</strong></span>
				<span class="tablinks" onclick="openCity(event, 'teacherlogin')"><strong>Teacher</strong></span>
 			 </div>
	      <!-- Modal content-->
	      
	      <div class="modal-content login-content tabcontent" id="userlogin" >
	        <div class="modal-body">
	          <div class="input_text"><h4>Student Login</h4></div>
	        <form action="userLogin" method="post">
	        
	          <div class="input_text"><input type="text" placeholder="Email address" name="userEmail"></div>
	          <div class="input_text"><input type="password" placeholder="Password" name="userPassword"></div>
	          <div class="margin-top-10 color-font"><a href="">forget Password</a></div>
	          <div><input type="submit" class="primary_btn" value="Login"></div>
	         </form>
	        </div>
	      </div>
	      
	      <div class="modal-content login-content tabcontent" id="teacherlogin" style="display:none">
	        <div class="modal-body">
	          <div class="input_text"><h4>Teacher Login</h4></div>
	        <form action="teacherLogin" method="post">
	          <div class="input_text"><input type="text" placeholder="Email address" name="userEmail"></div>
	          <div class="input_text"><input type="password" placeholder="Password" name="userPassword"></div>
	          <div class="margin-top-10 color-font"><a href="">forget Password</a></div>
	          <div><input type="submit" class="primary_btn" value="Login"></div>
	         </form>
	        </div>
	      </div>
	      
	  </div>
	</div>
 </div>
 <!-- footer-->
 <div class="row footer">
 	<div class="col-md-8">
 	<span> © Copyright 2018 | VClassroom</span>
 	</div>
 	<div class="col-md-4 developer-name">
 	</div>
 </div>
 </div>
 <script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
</div> 
</body>
</html>
