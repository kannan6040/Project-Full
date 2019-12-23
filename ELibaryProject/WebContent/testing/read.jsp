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
String title,genre,author,language,description,publisher,type;
int year;
if(request.getParameter("submit")!=null)
{
	title=request.getParameter("title");
	genre=request.getParameter("genre");
	author=request.getParameter("author");
	language=request.getParameter("language");
	description=request.getParameter("description");
	publisher=request.getParameter("publisher");
	year=Integer.parseInt(request.getParameter("year"));
	type=request.getParameter("btype");
	Book book=new Book();
	book.setTitle(title);
	book.setGenre(genre);
	book.setAuthor(author);
	book.setLanguage(language);
	book.setDescription(description);
	book.setPublisher(publisher);
	book.setPublishedYear(year);
	book.setBookType(type);
	session.setAttribute("book1", book);
	response.sendRedirect("read2.jsp");
}
%>
<form>
Title<input type="text" name="title"><br>
Genre<input type="text" name="genre"><br>
Author<input type="text" name="author"><br>
Language<input type="text" name="language"><br>
Description<input type="text" name="description"><br>
Publisher<input type="text" name="publisher"><br>
Year<input type="text" name="year"><br>
Type<input type="text" name="btype"><br>
<input type="submit" name="submit">
</form>

</body>
</html>