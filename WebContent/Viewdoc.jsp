<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.io.*" import="Connection.*" %>
    <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String fileName=request.getParameter("fileName");%>
<%
try
{
	byte[] filedata=null;
	PreparedStatement pst;
	Connection conn=connectionFile.getConnection();
	String sql="Select fileUpload from Notes where fileName=?";
	pst=conn.prepareStatement(sql);
	pst.setString(1,fileName);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		Blob file=rs.getBlob("fileUpload");
		filedata=file.getBytes(1,(int) file.length());
	}
	else
	{
	out.println("file not found");
	}
	response.setContentType("application/pdf");
	response.setHeader("Content-Disposition","inline");
	response.setContentLength(filedata.length);
	OutputStream output=response.getOutputStream();
	output.write(filedata);
	out.clear(); // where out is a JspWriter
	out = pageContext.pushBody();
	return;
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>