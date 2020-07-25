<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

int score=0;
String resp[]=new String[5];

resp[0]=new String(request.getParameter("question-1-answers"));
resp[1]=new String(request.getParameter("question-2-answers"));
resp[2]=new String(request.getParameter("question-3-answers"));
resp[3]=new String(request.getParameter("question-4-answers"));
resp[4]=new String(request.getParameter("question-5-answers"));
String ans[]={"A","A","A","A","A"};

for(int i=0;i<5;i++)
{
	if(resp[i].equals(ans[i]))
	{
		score=score+1;
	}
	
}
out.println(score +"/"+5);
%>
</body>
</html>