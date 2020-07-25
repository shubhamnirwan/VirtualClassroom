<%@ page import="myPack.*" import="java.io.*" import="java.sql.*" import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VClassroom-teacherNotes</title>
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
          <li><a href="Teacherindex.jsp">Home</a></li>
          <li><a href="ChatLogin.jsp">ChatRoom</a></li>
          <li class="active"><a href="TeacherNotes.jsp">Notes</a></li>
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
<div class="row">
<div class="col-lg-2">
</div>
<div class="col-lg-9" style= "border: 1px solid #dadada;
    border-radius: 4px;
    margin-left: 10px;
    background-color: #fff;
    -webkit-box-shadow: -1px -1px 13px -5px rgba(207,207,207,1);
    -moz-box-shadow: 3px 3px 13px -5px rgba(207,207,207,1);
    box-shadow: 3px 3px 13px -5px rgba(207,207,207,1);
    padding-top: 10px;
    top: 65px;">
    
    <form enctype="multipart/form-data" action="fileupload?username" method="post" >
  <div class="form-group">
    <label for="exampleInputName">File Name</label>
    <input type="text" class="form-control" name="fileName" id="exampleInputEmail1" placeholder="enter file name">
  </div>
  <div class="form-group">
    <label for="exampleInputName1">File Topic</label>
    <input type="text" class="form-control" name="fileTopic" placeholder="enter file topic">
  </div>
  <div class="form-group">
    <label for="exampleInputFile">File input</label>
    <input type="file"  name="fileUpload">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
<!--  
<form enctype="multipart/form-data" action="fileupload?username" method="post" >
filename<input type="text" name="fileName"><br>
fileTopic<input type="text" name="fileTopic"><br>
file<input type="file" name="fileUpload" /><br>

<input type="submit" value="SUBMIT" >
</form>-->
<br>
<h4 style="color: #ca0000;">Notes Uploaded by you</h4>
<br>
<table class="table table-hover">
	<tr>
	<th>Teacher name</th>
	<th>filename</th>
	<th>fileno</th>
	<th>filedate</th>
	<th>filetopic</th>
	</tr>
<%
String userName=user.getUserName();
ResultSet RS=new DAO().Selfnotes(userName);
while(RS.next())
{
	
%>



	<tr>
	<td><%=RS.getString(6) %></td>
	<td><a href="Viewdoc.jsp?fileName=<%=RS.getString(1) %>" ><%=RS.getString(1) %></a></td>
	<td><%=RS.getString(3) %></td>
	<td><%=RS.getString(4) %></td>
	<td><%=RS.getString(5) %></td>
	
	</tr>
	
<%} %>	
</table>
<br>
<h4 style="color: #ca0000;">Total Notes Uploaded </h4>
<br>
<table class="table table-hover">
	<tr>
	<th>Teacher name</th>
	<th>filename</th>
	<th>fileno</th>
	<th>filedate</th>
	<th>filetopic</th>
	</tr>
<%

ResultSet RS1=new DAO().Currentnotes();
while(RS1.next())
{
%>



	<tr>
	<td><%=RS1.getString(6) %></td>
	<td><a href="Viewdoc.jsp?fileName=<%=RS1.getString(1) %>" ><%=RS1.getString(1) %></a></td>
	<td><%=RS1.getString(3) %></td>
	<td><%=RS1.getString(4) %></td>
	<td><%=RS1.getString(5) %></td>
	
	</tr>
	
<%} %>	
</table>
</div>
</div> 
</body>
</html>
