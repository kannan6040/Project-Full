<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.bl.*,com.dto.*" %>
    <%@ page import="java.util.*"%>
    
<!DOCTYPE html>
<html>
    <head>
        <title>User Book Search</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/userbooksearch.css">

          <link rel="stylesheet" type="text/css" href="../includes/css/table.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../includes/js/verifybook.js"></script>
 
  	

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
     
      <li class="active"><a href="../User/userhome.jsp">Home</a></li>
      
      

      <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Books<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);" class="dropdown-menu">
          <li><a style="color: grey; " href="userbooksearch.jsp">Search Books</a></li>
          <li><a style="color: grey;" href="userviewallbook.jsp">View Books</a></li>
          <li><a style="color: grey;" href="userfavoritebooks.jsp">Recommended Books</a></li>
          <li><a style="color: grey;" href="http://localhost:8090/spring_mvc_reqbook/index.jsp">Request A Book</a></li>
          
        </ul>
      </li>
      
      
     

     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8); " class="dropdown-menu">
          <li><a style="color: grey; " href="../User/userupdate.jsp">Modify Account</a></li>
          <li><a style="color: grey;" href="../User/userdelete.jsp" onclick="return confirm('Do you want to Delete and Logout?')">Delete Account</a></li>
          
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

<%!
String search="";
String searchFor="";

boolean errorFlag=false;

String message="";
User user=null;


%>


<%
String username="";
username=(String)session.getAttribute("user_name");
if(request.getParameter("submit")!=null)
{
	search=request.getParameter("search");
	searchFor=request.getParameter("searchfor");
// 	System.out.print(search);
// 	System.out.print(searchFor);
	
	
	if(search.equals("select"))
	  {
		  errorFlag=true;
	  }
	 if(searchFor.equals(""))
	  {
		  errorFlag=true;
	  }
	 
	 if(errorFlag==false)
	 {
		 ArrayList<Book> books=BookBl.searchBooks(search, searchFor);
		 session.setAttribute("books", books);
		response.sendRedirect("viewbooksearch.jsp") ;
	 }
	 else
	 {
		 
	 }
}
	 %>




<h1 style="color: white;"><%= "Welcome:"+username %></h1>
	


        <div class="box">
            
            <h1  style="color: white; margin-left: 155px; "> Search Book </h1>
            <br>
            <br>

            <form onsubmit="return searchValidate()">
                
                 
                
                <input style="margin-left: 190px; border-radius: 5px; width:30%;height: 30px;" type="text" name="searchfor" id="searchfor" placeholder="Search">
                <span id="esearch"style="color:red; font-size: 12px; font-weight: bold; position: fixed;left: 420px;bottom: 235px;visibility: hidden;">
                This Field cannot be Null</span>
		<br>
		<br>

                <div style="margin-left: 135px; " >
                	<label style="color: white;">Search Category:</label>
                
                <select  class="custominputstyle" name="search" id="search">
                
                <option value="author">Author</option>
                <option value="title">Title</option>
                <option value="genre">Genre</option>
                <option value="language">Language</option>
                
                </select>
            </div> 
<br>
                <input style="margin-left: 200px;" type="submit" name="submit" value="Search">
                

               

                
                

            </form>
        </div>






<br><br>
    


<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>



