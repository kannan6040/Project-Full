<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bl.*,com.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String emailId=(String)session.getAttribute("user_email");
int result=0;
result= UserBl.deleteUser(emailId);

if(result>0)
{
	response.sendRedirect("../Authentication/logout.jsp");
}

%>



</body>
</html>