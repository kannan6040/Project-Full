
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
int requestId=Integer.parseInt(request.getParameter("bookId"));
int result=0;
result= RequestBl.readRequest(requestId);

if(result>0)
{
	session.setAttribute("message", "Request Seen");
	response.sendRedirect("viewRequestBooks.jsp");
}



%>

</body>
</html>