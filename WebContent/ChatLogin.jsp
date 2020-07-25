<%@ page import="myPack.*" import="java.io.*" import="java.sql.*" import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VClassroom -teacher Chatroom</title>
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

<%@ page errorPage="error.jsp" %>
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
       <li></li>
       		<li><a href="Teacherindex.jsp">Home</a></li>
    	  <li class="active"><a href="ChatLogin.jsp">Chatroom</a></li>
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
<div class="margain-top-main container">

    <TABLE width="40%" border="0" cellspacing="1" cellpadding="1" align="center">
      <%
      String d=request.getParameter("d");
      String n=request.getParameter("n");
      String ic = request.getParameter("ic");
		
          if (d!=null && d.equals("t"))
          {
      %>
      <TR>
        <TD>
          <TABLE width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
            <TR>
              <TD colspan="2" align="center">
                <SPAN class="error">Nickname exists</SPAN><BR>
              </TD>
            </TR>
				<TR>
              <TD colspan="2">
                Nickname <B><%=n%></B> has already been taken please select some other nick.
              </TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
      <%
        }
        else if (ic!=null && ic.equals("t"))
        {
      %>
      <TR>
        <TD colspan="2">
          <TABLE width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
            <TR>
              <TD colspan="2" align="center">
                <SPAN class="error">Incomplete information</SPAN>
              </TD>
            </TR>
				<TR>
              <TD colspan="2">
                <b>Sex</b> and <b>Nickname</b> must be entered and nickname must be atleast <b>4</b> characters long and must not contain any <b>space</b>.
              </TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
      <%
        }
      %>
      <TR>
        <TD colspan="2">
          <FORM  name="login" method="post" action="<%=request.getContextPath()%>/servlet/login">
            <TABLE width="100%" border="0">
              <TR>
                <TD width="30%" >
                 UserName
                </TD>
                <TD width="70%">
                  <INPUT type="text" name="nickname" size="15">
                </TD>
              </TR>
              <TR>
                <TD width="30%">
                  gender
                </TD>
                <TD width="70%">
                  <SELECT size="1" name="sex">
                    <OPTION value="m">
                      Male
                    </OPTION>
                    <OPTION value="f">
                      Female
                    </OPTION>
                  </SELECT>
                </TD>
              </TR>
              <TR>
                <TD>
                 &nbsp;  
                </TD>
                <TD>
                  <INPUT type="submit" name="Submit" value="Submit">
                </TD>
              </TR>
            </TABLE>
          </FORM>
        </TD>
      </TR>
    </TABLE>
   
</div>
</body>
</html>


