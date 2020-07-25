<%@ page session="true" import="chatbox.ChatRoomList, chatbox.ChatRoom,Model.*" errorPage="error.jsp"%>
<%
	String nickname = (String)session.getAttribute("nickname");
	if (nickname != null && nickname.length() > 0)
	{
		ChatRoomList roomList = (ChatRoomList) application.getAttribute("chatroomlist");
		ChatRoom room = roomList.getRoomOfChatter(nickname);
		String roomname = room.getName();
		
%>
	
<HTML>
<HEAD>
<TITLE>VClassroom Chat - <%=nickname%> (<%=roomname%>) </TITLE>

</HEAD>
<FRAMESET rows="13%,*">
<FRAME SRC="sendMessage.jsp" name="TypeWin">
<FRAMESET cols="30%,*">
<FRAME SRC="displayMessages.jsp#current" name="MessageWin">
<% 
UserModel user = (UserModel)session.getAttribute("currentSessionUser");
if(user.getDesignation()==null)
{
%>
<FRAME SRC="StudentWhitebox.jsp">
<%
}
else
{
%>
<FRAME SRC="Whitebox.jsp">
<%
}
%>
</FRAMESET>



</FRAMESET>
<NOFRAMES>
<H2>This chat rquires a browser with frames support</h2>
</NOFRAMES>
</HTML>
<%
}
else
{
	response.sendRedirect("ChatLogin.jsp");
}
%>