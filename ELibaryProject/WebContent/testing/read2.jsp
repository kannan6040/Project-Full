<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dl.*,com.dto.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int res=0;
int id=0;
Book book=(Book)session.getAttribute("book1");
out.print(book.getPublishedYear());

	res=BookDl.addBook(book);
	if(res>0)
	{
		out.print("YES1");
		id=BookDl.currentBook();
		%>
		<form action="UploadPdf" method="post" enctype="multipart/form-data">
<input type="file" name="pdf" accept=".pdf">
<input type="text" name="bookId" value=<%= id %> readonly>
<input type="submit">
		
		<% 
		
	}


%>



</body>
</html>