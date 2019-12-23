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
       
        <link rel="stylesheet" type="text/css" href="../includes/css/adminaddbook.css">

 
  	

<style type="text/css">
                #etitle,#egenre,#eauthor,#elanguage,#edescription,#epublisher,#epublishedyear,#ebooktype{color: red}
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

<%!
String title="";
String genre="";
String author="";
String language="";

String tempdescription="";
String description="";
String publisher="";
String publishedyear="";
String booktype="";
boolean errorFlag=false;

String message="";
Book book=null;


%>


<%
if(request.getParameter("submit")!=null)
{
	 title=request.getParameter("title");
	 genre=request.getParameter("genre");
	 author=request.getParameter("author");
	 language=request.getParameter("language");
	 
	 tempdescription=request.getParameter("description");
	 description=tempdescription.trim();
	 publisher=request.getParameter("publisher");
	 publishedyear=request.getParameter("publishedyear");
	 booktype=request.getParameter("booktype");
	 
	 
	 if(title.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(genre.equals("select"))
	  {
		  errorFlag=true;
	  }
	 if(author.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(language.equals("select"))
	  {
		  errorFlag=true;
	  }
	 
	 if(description.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(publisher.equals("select"))
	  {
		  errorFlag=true;
	  }
	 if(publishedyear.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(booktype.equals(""))
	  {
		  errorFlag=true;
	  }
	 
	 if(errorFlag==false)
	 {
		 book=new Book();
		 book.setTitle(title);
		 book.setAuthor(author);
		 book.setBookType(booktype);
		 book.setDescription(description);
		 book.setGenre(genre);
		 book.setLanguage(language);
		 book.setPublisher(publisher);
		 book.setPublishedYear(Integer.parseInt(publishedyear) );
		 
		 int result=0;
		 result=BookBl.addBook(book);
		 if(result>0)
		 {
			// message="Added Successfully";
			 response.sendRedirect("adminaddbook2.jsp");
		 }
		 else
		 {
			 session.setAttribute("message", "Failed to Add Book");
			 response.sendRedirect("../Admin/adminhome.jsp");
		 }
		 
		 
		 
	 }
	 else
	 {
		// message="Failed to Add Book";
	 }
	
}



%>

<div style="height: 1000px; position: relative;">
        <div class="box">
            <h2>Add Book</h2>

            <p style="color: red" align="center" id="id1"><%= message %></p>
            
            <form name="f4" method="post" onsubmit="return verifyaddbook()">
                <table>
                	


                	<tr>
                	<td> <label style="color: white;">Title</label></td>
                	<td><input class="input" type="text" name="title" id="title"></td>
                    <td><span style="color: red;visibility: hidden;" id="etitle">Please enter a title</span></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Genre</label></td>
                	
                   <td>
                   	<select class="custominputstyle" id="genre" name="genre">
                    <option value="select">Genre</option>
                    <option value="fiction">Fiction</option>
                    <option value="fantasy">Fantasy</option>
                    <option value="thriller">Thriller</option>
                    <option value="sciencefiction">Science Fiction</option>
                    <option value="mystery">Mystery</option>



                    </select>
                </td>
                <td><span style="color: red;visibility: hidden;" id="egenre"> Please select a Genre</span></td>	
                    </tr>



                    <tr>
                	<td> <label style="color: white;">Author</label></td>
                	<td><input  class="input"  type="text" name="author" id="author"></td>
                    <td><span style="color: red;visibility: hidden;" id="eauthor">Invalid Author</span></td>
                    </tr>


                    

                   

                    <tr>
                   <td> <label style="color: white;">Language</label></td>
                   <td>
                   	<select class="custominputstyle" id="language" name="language">
                    <option value="select">Language</option>
                    <option value="english">English</option>
                    <option value="hindi">Hindi</option>
                    <option value="malayalam">Malayalam</option>
                    </select>
                </td>
                <td><span style="color: red;visibility: hidden;" id="elanguage"> Please select Language</span></td>	
                    </tr>


                    <tr>
                    <td><label style="color: white;">Description</label></td>
                    <td>
                    <textarea class="textareastyle" name="description" id="description" rows="4" cols="50">
                    </textarea>
                    </td>
                    <td><span style="color: red;vertical-align: 45px;visibility: hidden;" id="edescription"> Please Enter a Description</span></td>
                    <tr>


                    <tr>
                	<td> <label style="color: white;">Publisher</label></td>
                	<td><input  class="input"  type="text" name="publisher" id="publisher"></td>
                    <td><span style="color: red;visibility: hidden;" id="epublisher"> Invalid Publisher</span></td>
                    </tr>




                    <tr>
                	<td> <label style="color: white;">Published Year</label></td>
                	<td><input  class="input"  type="text" name="publishedyear" id="publishedyear"></td>
                    <td><span style="color: red;visibility: hidden;" id="epublishedyear">Published Year should be between 1700 and 2020</span></td>
                    </tr>


                     <tr>
                   <td> <label style="color: white;">Book Type</label></td>
                   <td>
                   	<select class="custominputstyle" id="booktype" name="booktype">
                    <option value="select">Book Type</option>
                    <option value="novel">Novel</option>
                    <option value="magazine">Magazine</option>
                    <option value="journel">Journel</option>
                    <option value="educational">Educational</option>
                    <option value="business">Business</option>
                    <option value="travel">Travel</option>



                    </select>
                </td>
                <td><span style="color: red;visibility: hidden;" id="ebooktype"> Please select a Book type</span></td>	
                    </tr>


                  <tr>
                  	<td><input align="center" type="submit" name="submit" value="Add Book">
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



