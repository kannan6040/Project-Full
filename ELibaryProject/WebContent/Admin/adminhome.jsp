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
        <title>Admin Home Page</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/adminhomepage.css">


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
     
      <li class="active"><a href="adminhome.jsp">Home</a></li>

       <li><a href="viewusers.jsp">Users</a></li>

        <li><a href="pendingrequests.jsp">Pending User Requests</a></li>

        <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Books<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);  font-size: 18px;" class="dropdown-menu">
          <li><a style="color: grey; " href="../Book/adminviewallbooks.jsp">View All Books</a></li>
          <li><a style="color: grey;" href="../Book/adminbooksearch.jsp">Search Books</a></li>
          <li><a style="color: grey;" href="../Request/viewRequestBooks.jsp">Book Requests</a></li>
          
        </ul>
      </li>

      



     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);  font-size: 18px; " class="dropdown-menu">
        	<li><a style="color: grey;" href="adminlistsuper.jsp">Admins List</a></li>
          <li><a style="color: grey; " href="modifyadmin.jsp">Modify Account</a></li>
          <li><a style="color: grey;" href="deleteadmin.jsp" onclick="return confirm('Do you want to Delete and Logout?')">Delete Account</a></li>
          
        </ul>
      </li>

      
      <li><a href="../Authentication/adminlogout.jsp">Logout</a></li>
     
     </ul>

  </div>
</nav>

<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("admin_name")==null)
{
	
	response.sendRedirect("../Authentication/adminlogin.jsp");
}
 
%>


<%

String message="";
if(session.getAttribute("message")!=null)
{
	message=(String)session.getAttribute("message");
	session.setAttribute("message", null);
}

if(request.getAttribute("message")!=null)
{
	message=(String)request.getAttribute("message");
	request.setAttribute("message", null);
	
}

%>



<h1 style="color: white;"> Welcome: <%=(String)session.getAttribute("admin_name") %></h1><br>



  <p class="message" ><%= message %></p>









<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>



