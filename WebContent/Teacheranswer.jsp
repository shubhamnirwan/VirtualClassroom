<%@ page import="myPack.*" import="java.io.*" import="java.sql.*" import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VClassroom - Answers</title>
<!--Additional CSS-->
<link rel="stylesheet" href="css/style.css" />
<!--Complete CSS-->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--Complete JavaScript-->
<link href='https://fonts.googleapis.com/css?family=ABeeZee' rel='stylesheet'>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!--Complete JavaScript Bundle-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
	String message=(String)request.getParameter("msg");
	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
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
     		<li><a href="Teacherindex.jsp">Home</a></li>
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
			<%=user.getUserName()%>
			
           
        </div>
			<%
		}
        %>
        </div>
    </div>
    <div class="col-lg-9 feeds_panel answer_panel">
	 <div>
	 <%
	 	ResultSet RS=(ResultSet)request.getAttribute("RS");
	 	if(RS.next())
	 	{
	 %>
        	<div class="padding-left-10 padding-bottom-12 color-font">Question by: <%=RS.getString("USEREMAIL") %></div>
           	 <div class="feed box">
                <div class="heading"><%=RS.getString("POSTTITLE") %></div>
                <div class="post padding-top-10"><%=RS.getString("POSTDISCRIPTION") %></div>
				<div></div>
            </div>
            <div class="padding-left-10 up-down-border like-color">
	          <%//<span><a href="">Like</a></span> %>  
	             <%
	        	if(user==null)
	        		
	        	{
        		%>
	            <span class="padding-left-10"><a data-toggle="modal" data-target="#myModal">Answer</a></span>
	            <%
	        	}
	            %>
	           
            </div>
            <%
        	if(user!=null)
        		
        	{
        		%>
            <div class="margin-top-10 textarea">
            <div class="padding-left-10 padding-top-10 color-font size-12">Your Answer</div>
            	<form action="TeacherPostReply">
            		<input type="hidden" value="<%=RS.getInt(1) %>" name="postId">
					<textarea rows="3" cols="100" name="postReply"></textarea>
					<input class="primary_btn" type="submit" value="Reply">
            	</form>
            </div>
            <%
        	}
            %>
            <div class="padding-left-10 padding-top-10 color-font size-12">Answer by users</div>
		
		<%
		ResultSet RST=(ResultSet)request.getAttribute("RST");
		while(RST.next())
		{
			%>
	         <div class="feed box margin-top-10">
	            	<div class="post"><%=RST.getString("USEREMAIL")%></div>
	            	<div class=""><%=RST.getString(2)%></div>
	            </div>
	         <%
		}
	 	}
         %>      	 
     </div>
    </div>
	  <!--User Login Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <div class="modal-title">Login for answer the post...</div>
	        </div>
	        <div class="modal-body">
	        <form action="userLogin" method="post">
	          <div class="input_text"><input type="text" placeholder="Email address" name="userEmail"></div>
	          <div class="input_text"><input type="password" placeholder="Password" name="userPassword"></div>
	          <div class="margin-top-10 color-font"><a href="">forget Password</a></div>
	          <div><input type="submit" class="primary_btn" value="Login"></div>
	         </form>
	        </div>
	        <div class="modal-footer">
	        </div>
	      </div>
	      
	    </div>
	  </div>
</div>
<%
	if(message!=null)
	{
		if(message.equals("postDone"))
		{

			%>
			<script type="text/javascript">
			$(window).load(function(){        
		   $('#myModal2').modal('show');
		    }); 
	</script>
			<%
		}
	}
%>
 <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body">
          <p>Your Reply has posted.</p>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>
