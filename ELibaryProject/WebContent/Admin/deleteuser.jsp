<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bl.*,com.dto.*" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String emailid=request.getParameter("emailId");
int result=0;
result=UserBl.deleteUser(emailid);
if(result>0)
{	
	String message="User Deletion Successfull";
	session.setAttribute("message", message);
	response.sendRedirect("adminhome.jsp");
	
}
else
{
	String message="User Deletion Failed";
	session.setAttribute("message", message);
	response.sendRedirect("adminhome.jsp");
}

%>

</body>
</html>