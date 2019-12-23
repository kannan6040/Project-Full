<%@page import="com.bl.BookBl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>User Home</title>
       
        
        <link rel="stylesheet" type="text/css" href="../includes/css/userhome.css">

<style type="text/css">



</style>

        
    </head>
<html>    
    <body>
      



<nav style="background: rgba(0,0,0,.8);height: 70px;"  class="navbar navbar-inverse">
  <div  style="font-size: 20px;" class="container-fluid">
  


    <div class="navbar-header">
      <a   class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul   class="nav navbar-nav">
     
      <li class="active"><a href="userhome.jsp">Home</a></li>
      
      

      <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Books<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);" class="dropdown-menu">
          <li><a style="color: grey; " href="../Book/userbooksearch.jsp">Search Books</a></li>
          <li><a style="color: grey;" href="../Book/userviewallbook.jsp">View Books</a></li>
          <li><a style="color: grey;" href="../Book/userfavoritebooks.jsp">Recommended Books</a></li>
          <li><a style="color: grey;" href="http://localhost:8090/spring_mvc_reqbook/index.jsp">Request A Book</a></li>
          
        </ul>
      </li>
      
      
     

     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8); " class="dropdown-menu">
          <li><a style="color: grey; " href="userupdate.jsp">Modify Account</a></li>
          <li><a style="color: grey;" href="userdelete.jsp" onclick="return confirm('Do you want to Delete and Logout?')">Delete Account</a></li>
          
        </ul>
      </li>

      
      <li><a href="../Authentication/logout.jsp" onclick="return confirm('Do you want to Logout?')">Logout</a></li>
     
     </ul>
    


   



  </div>
</nav>

<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("user_name")==null)
{
	
	response.sendRedirect("../Authentication/userlogin.jsp");
}
 
%>

<%
BookBl.cleanBook();
String username="";
username=(String)session.getAttribute("user_name");
%>
<%

String message="";
if(session.getAttribute("message")!=null)
{
	message=(String)session.getAttribute("message");
	session.setAttribute("message", null);
}
%>


<h1 style="color: white;"> <%= "Welcome:"+username %></h1>



<p class="message"><%= message %></p>







<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>



