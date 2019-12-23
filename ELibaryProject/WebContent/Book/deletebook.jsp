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
int bookId=Integer.parseInt(request.getParameter("bookId"));
int result=0;
result=BookBl.deleteBook(bookId);
if(result>0)
{
	session.setAttribute("message", "Book Deletion Success");
	response.sendRedirect("adminviewallbooks.jsp");
}
else
{
	session.setAttribute("message", "Book Deletion Failed");
	response.sendRedirect("adminviewallbooks.jsp");
}
%>

</body>
</html>