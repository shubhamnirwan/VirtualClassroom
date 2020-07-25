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
	UserModel user = (UserModel)session.getAttribute("currentSessionUser"); // Strore value from session object in a refrence variable
%>

</head>
<body>
<script type="text/javascript">
function loadDoc(url) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("mainbox").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", url, true);
	  xhttp.send();
	}
</script>
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
<div class="row body">
    
   <div class="col-lg-2 course"  >
            
        <%
          if(user!=null)
		{
        	  %>
     
			<%=user.getUserName()%>
			
           
        
			<%
		}
        %>
        
        <h4>Course outline</h4>
        <h5>WEEK 1</h5>
       <div class="list-group">
       <a class="list-group-item" onclick=" loadDoc('week1lecture.jsp')">Lecture- OOPS</a>
       <a class="list-group-item" onclick=" loadDoc('week1lecturenotes.jsp')">Lecture Notes</a>
       <a class="list-group-item" onclick=" loadDoc('week1quiz.jsp')">Quiz</a>
       </div>
       <h5>WEEK 2</h5>
       <div class="list-group">
       <a class="list-group-item" onclick=" loadDoc('week2lecture.jsp')">Lecture- Multithreading</a>
       <a class="list-group-item" onclick=" loadDoc('week1lecturenotes.jsp')">Lecture Notes</a>
       <a class="list-group-item" onclick=" loadDoc('week2quiz.jsp')">Quiz</a>
       </div>
     	<h5>WEEK 3</h5>
       <div class="list-group">
       <a class="list-group-item" onclick=" loadDoc('week3lecture.jsp')">Lecture</a>
       <a class="list-group-item" onclick=" loadDoc('week1lecturenotes.jsp')">Lecture Notes</a>
       <a class="list-group-item" onclick=" loadDoc('week3quiz.jsp')">Quiz</a>
       </div>
       </div>
       <div class="col-lg-8" id="mainbox">
       
       </div> 
</div>	   
</body>
</html>