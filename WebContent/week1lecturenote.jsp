<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
PrintWriter out1 = response.getWriter();
response.setContentType("application/pdf");
String filepath = "E:\\Eclipse\\Workspace\\VirtualClassroom\\WebContent\\docs\\OOProgWithJava-notes.pdf";
response.setHeader("Content-Disposition", "inline; filename=’OOProgWithJava-notes.pdf'");
FileOutputStream fileout = new FileOutputStream(filepath);
fileout.close();
out1.close();%>
</body>
</html>