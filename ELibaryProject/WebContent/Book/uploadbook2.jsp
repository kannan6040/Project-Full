<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Upload New PDF</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/uploadnewpdf.css">

          <link rel="stylesheet" type="text/css" href="table.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


 
  	

<style type="text/css">
#efile
{
  color: red;
}
</style>

        
    </head>
<html>    
    <body>
     <script type="text/javascript" src="../includes/js/upload.js"></script> 


<nav style="background: rgba(0,0,0,.8);height: 70px;"  class="navbar navbar-inverse">
  <div  style="font-size: 20px;" class="container-fluid">
  


    <div class="navbar-header">
      <a   class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul   class="nav navbar-nav">
     
      <li class="active"><a href="../Admin/adminhome.jsp">Home</a></li>

       <li><a href="../Admin/viewusers.jsp">Users</a></li>

        <li><a href="../Admin/pendingrequests.jsp">Pending User Requests</a></li>

        <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Books<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);  font-size: 18px;" class="dropdown-menu">
          <li><a style="color: grey; " href="adminviewallbooks.jsp">View All Books</a></li>
          <li><a style="color: grey;" href="adminbooksearch.jsp">Search Books</a></li>
          <li><a style="color: grey;" href="../Request/viewRequestBooks.jsp">Book Requests</a></li>
          
        </ul>
      </li>

      



     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);  font-size: 18px; " class="dropdown-menu">
        	<li><a style="color: grey;" href="../Admin/adminlistsuper.jsp">Admins List</a></li>
          <li><a style="color: grey; " href="../Admin/modifyadmin.jsp">Modify Account</a></li>
          <li><a style="color: grey;" href="../Admin/deleteadmin.jsp" onclick="return confirm('Do you want to Delete and Logout?')">Delete Account</a></li>
          
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
int bookId=Integer.parseInt(request.getParameter("bookId"));

%>



<h1 style="color: white;">Welcome: <%=(String)session.getAttribute("admin_name") %></h1> 

<div style="color: white; font-weight: bold;" class="box">

<form name="f6" action="UploadPdf3" method="post" enctype="multipart/form-data" onsubmit="return validatebrowse()">
<h3>Choose a File to Upload:</h3>
<br>
Book Id:<input class="input" type="text" name="bookid" id="bookid" readonly="readonly" value=<%=bookId%>>
                 
<input type="file" name="pdf" id="file" value="browse" accept=".pdf">
<span style="position: absolute; left:242px; bottom:135px; color: red; visibility: hidden;" id="efile">Please Upload a File</span>
<br>
<input type="submit" name="submit" value="Upload">

</div>
</form>











<div class="footer">
  <p style="  font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>



