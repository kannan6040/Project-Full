<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bl.*,com.dto.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Registration Form</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/adminaddbook2.css">

 
  	

<style type="text/css">
               
</style>

        
    </head>
<html>    
    <body>
      
<script type="text/javascript" src="../includes/js/verifybook.js"></script>

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
String message="";
Book book1=null;
int bookid=0;
String title="";
String genre="";
String author="";
String language="";

String tempdescription="";
String description="";
String publisher="";
String publishedyear="";
String booktype="";

bookid=BookBl.currentBook();
book1=BookBl.getBook(bookid);





%>
















<div style="height: 1000px; position: relative;">
        <div class="box">
            <h2>Book Upload Form </h2>

            <p style="color: red" align="center" id="id1"><%= message %></p>
            
            <form name="f4" action="UploadPdf" method="post" enctype="multipart/form-data" onsubmit="return verifybrowse()">
                <table>

                  <tr>
                  <td> <label style="color: white;">Book Id</label></td>
                  <td><input class="input" type="text" name="bookid" id="bookid" readonly="readonly" value=<%=book1.getBookId() %>></td>
                    </tr>

                	


                	<tr>
                	<td> <label style="color: white;">Title</label></td>
                	<td><input class="input" type="text" name="title" id="title" readonly="readonly" value='<%=book1.getTitle() %>'></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Genre</label></td>
                	                 


                    <td><input class="input" type="text" name="genre" id="genre" readonly="readonly" value=<%=book1.getGenre() %>></td>

                    </tr>



                    <tr>
                	<td> <label style="color: white;">Author</label></td>
                	<td><input  class="input"  type="text" name="author" id="author" readonly="readonly" value='<%=book1.getAuthor() %>'></td>
                    </tr>


                    

                   

                    <tr>
                   <td> <label style="color: white;">Language</label></td>
                   
                    <td><input class="input" type="text" name="language" id="language" readonly="readonly" value=<%=book1.getLanguage() %>></td>
                   
                    </tr>


                    <tr>
                    <td><label style="color: white;">Description</label></td>
                    <td>
                    <textarea class="textareastyle" name="description" id="description" rows="4" cols="50" readonly="readonly"><%=book1.getDescription().trim() %></textarea>
                    </td>
                    <tr>


                    <tr>
                	<td> <label style="color: white;">Publisher</label></td>
                	<td><input  class="input"  type="text" name="publisher" id="publisher" readonly="readonly" value='<%=book1.getPublisher() %>'></td>
                    </tr>




                    <tr>
                	<td> <label style="color: white;">Published Year</label></td>
                	<td><input  class="input"  type="text" name="publishedyear" id="publishedyear" readonly="readonly" value= <%= book1.getPublishedYear() %>></td>
                    </tr>


                     <tr>
                   <td> <label style="color: white;">Book Type</label></td>
                   
                                      <td><input  class="input"  type="text" name="booktype" id="booktype" readonly="readonly" value=<%=book1.getBookType() %>></td>

                   	
                
                    </tr>


                  <tr>
                    <td> <label style="color: white;">Upload File</label></td>
                     <td><input align="center" type="file" name="pdf" id="file" value="browse" accept=".pdf"></td>
                   
 
                   
              <td><span style="color: red;visibility: hidden;" id="efile">Please upload a file</span></td>


            
                  </tr>








                  <tr>
                  	<td><input align="center" type="submit" name="submit" value="Upload">
            </td>
                  </tr>



              </table>
                   
                     </form>
        </div>


</div> 





<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>



