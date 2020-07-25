<%@ page import="myPack.*" import="java.io.*" import="java.sql.*" import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VClassroom - User Profile</title>
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
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
	request.setAttribute("msg", "sessionEnded");
	
	UserModel user = (UserModel)session.getAttribute("currentSessionUser");
	if(user==null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp?lastPage=userProfile");
		rd.forward(request, response);
	}
%>

</head>
<body>

<div class="container-fluid header primary_font navbar-fixed-top">
<nav class="navbar">
 <div class="container">
  	<div class="navbar-header">
      <a class="navbar-brand" href="studentindex.jsp">VClassroom</a>
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
        		
   
          
          <li><a href="Studentindex.jsp">Home</a></li>
          <li><a href="StudentChatLogin.jsp">ChatRoom</a></li>
          <li><a href="StudentNotes.jsp">Notes</a></li>
          <li><a href="post.jsp">Ask a Question</a></li>
          <li><a href="Discussion.jsp">Discussion</a></li>
          <li class="active"><a href="userProfile.jsp">Profile</a></li>
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
			<%=user.getUserName() %>
        </div>
			<%
		}
        %>
       </div>
    </div>
    <div class="col-lg-9 feeds_panel">
             <!-- <div class="post feed margin-top-10">
            	<form action="UserUpdate" enctype="multipart/form-data">
                <div class="post">Upload Profile Image <input type="file" name="userImage"><input type="submit" value="Upload"></div>
                </form> 
            </div>-->
            <div class="post feed margin-top-10">
                <div class="post">Full Name: <%if(user!=null) out.print(user.getUserName()); %></div>
            </div>
            <div class="post feed margin-top-10">
                <div class="post">Father Name: <%if(user!=null) out.print(user.getFatherName()); %></div>
            </div>
            <div class="post feed margin-top-10">
                <div class="post">Mother Name: <%if(user!=null) out.print(user.getMotherName()); %></div>
            </div>
            <div class="post feed margin-top-10">
                <div class="post">Address: <%if(user!=null) out.print(user.getAddress()); %></div>
            </div>
            <div class="post feed margin-top-10">
                <div class="post">Email Address: <%if(user!=null) out.print(user.getUserEmail()); %></div>
            </div>
            <div class="post feed margin-top-10">
                <div class="post">Mobile Number:<%if(user!=null) out.print(user.getMobileNo()); %></div>
            </div>
            <div class="post feed margin-top-10">
                <div class="post">Password: <%if(user!=null) out.print(user.getUserPassword());%></div>
            </div>
	</div>
 </div>
</div> 
</body>
</html>
