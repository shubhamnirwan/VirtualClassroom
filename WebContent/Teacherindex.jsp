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
	if(msg.equals("deleteWhiteboardSuccess"))
	{
		out.print("your whwite board is deleted");
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
      <a class="navbar-brand" href="Teacherindex.jsp">VClassroom</a>
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
    <form class="navbar-form navbar-left" action="#">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
          <li class="active"><a href="Teacherindex.jsp">Home</a></li>
          <li><a href="ChatLogin.jsp">ChatRoom</a></li>
          <li><a href="TeacherNotes.jsp">Notes</a></li>
          <li><a href="TeacherPost.jsp">Post</a></li>
          <li><a href="TeacherProfile.jsp">Profile</a></li>
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
<%
	ResultSet RS=new DAO().AllPosts();
	while(RS.next())
	{
		Integer postId=RS.getInt("POSTID");
		%>
        <div>
        	<div class="padding-left-10 color-font">Question by: <%=RS.getString(4) %></div>
           	 <a href="TeacherAnswer?postId=<%=postId%>">
           	 <div class="feed">
                <div class="heading black-color"><%=RS.getString(2) %></div>
                <div class="post padding-top-10"><%=RS.getString(3) %></div>
            </div>
            </a>
            <br>
     <% //     <div class="padding-left-10 like-color margin-bottom-10"><span class="padding-left-10"><a href="">2 Answers</a></span> <span class="padding-left-10"><a href="">Share</a></span></div>  %>
        </div>
       <% 
	}

%> 
	</div>
 </div>
</div> 
</body>
</html>
