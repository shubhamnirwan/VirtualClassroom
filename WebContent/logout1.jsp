<%@ page import="chatbox.*" errorPage="error.jsp" %>
<HTML>
<HEAD>
<TITLE>You have logged out</TITLE>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/chat.css">
<META http-equiv="pragma" content="no-cache">
<meta name="Author" content="Sukhwinder Singh (ssruprai@hotmail.com">	
</HEAD>
<BODY>
<%@ include file="header.jsp" %>
<div align="center">
<center>

<%
	String nickname = (String)session.getAttribute("nickname");
	if (nickname != null && nickname.length() > 0)
	{
		ChatRoomList roomlist = (ChatRoomList) application.getAttribute("chatroomlist");
		ChatRoom chatRoom = roomlist.getRoomOfChatter(nickname);
		chatRoom.addMessage(new Message("system", nickname + " has logged out.", new java.util.Date().getTime()));
		if ( chatRoom != null)
		{
			chatRoom.removeChatter(nickname);
			session.invalidate();
			out.write("<font color=\"blue\">You successfully logged out</font><br>");
			out.write("<a href=\"index.jsp\">Login again</a>");
		}
		else
		{
			//out.write("<h3><font color=\"red\">Unable to logout</font></h3>");
			response.sendRedirect("index.jsp");
		}
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
	%>
</center>
</div>
</BODY>
</HTML>