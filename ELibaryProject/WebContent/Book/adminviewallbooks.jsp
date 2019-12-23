<%@ page language="java" contentType="text/html; charset=ISO-8859-1"


    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.bl.*,com.dto.*" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Table</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/userviewallbook.css">

          <link rel="stylesheet" type="text/css" href="../includes/css/table.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


 
  	

<style type="text/css">

.message1{
	
	margin-left: 420px;
    font-size: 20px;
    background:rgba(0,0,0,.8);
   width: 35%;
 text-align: center;
 color: green;
 border-radius: 4px;
    	
}
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
<h1 style="color: white;">Welcome: <%=(String)session.getAttribute("admin_name") %></h1> 
<h2 style="color: white; text-align: center;">All Books</h2>

<p class="message1" ><%=message %></p>
<input style="position:absolute; left:87%; bottom:380px;" type="button" value="Add Book" onclick="window.location.href = 'adminaddbook.jsp';">
<br>
<br>

<br>
    
        <div style="background-color: white; color: black;" class="table100 ver5 m-b-110">
          
          <table data-vertable="ver5">
          <%
          BookBl.cleanBook();
 //         ArrayList<Book> books=null;
 		  ArrayList<Book> books=BookBl.getBooks();
		 if(books!=null && (books.size()>0))
				  {
								  
		%>
            
              <tr style=" color: black;"  class="row100 head">
                <th class="column100 column2" >Book ID</th>
                <th class="column100 column2" >Title</th>
                <th class="column100 column3" >Genre</th>
                <th class="column100 column4">Author</th>
                <th class="column100 column5" >Language</th>
                <th class="column100 column1" >Description</th>
                <th class="column100 column7" >Publisher</th>
                <th class="column100 column8" >Published Year</th>
                <th class="column100 column8" >Book Type</th>
                <th class="column100 column8" >Action</th>
                
              </tr>
           
            <tbody>
             <%
		       for(Book book : books)
					{
		    %>


              <tr class="row100">
                <td class="column100 column2" ><%= book.getBookId() %></td>
                <td class="column100 column2" ><%= book.getTitle() %></td>
                <td class="column100 column3" ><%= book.getGenre() %></td>
                <td class="column100 column4" ><%= book.getAuthor() %></td>
                <td class="column100 column5" ><%= book.getLanguage() %></td>
                <td class="column100 column1" ><%= book.getDescription() %></td>
                <td class="column100 column7" ><%= book.getPublisher() %></td>
                <td class="column100 column8" ><%= book.getPublishedYear() %></td>
                <td class="column100 column9" ><%= book.getBookType() %></td>
                <td class="column100 column1" >
                <a href="viewBook.jsp?bookId=<%=book.getBookId()%>" target="_blank">View</a>
                <br>
                <a href="modifybook1.jsp?bookId=<%=book.getBookId()%>">Modify Details</a>
                <br>
                <a href="uploadbook1.jsp?bookId=<%=book.getBookId() %>">Upload New PDF</a>
                <br>
                <a href="deletebook.jsp?bookId=<%=book.getBookId() %>" onclick="return confirm('Do you want to Delete?')">Delete</a>
                
                </td>
              </tr>
              <%
					  }
						  }
							          else
							          {
							        	  %>
							        	  
							         <tr class="row100">
                <td  colspan="10" align="center"> <span >No Book details found </span> </td>
                </tr>
							        
							        	  
							        	  <%
							          }
					        	  
					          
					        %>
              

            </tbody>
          </table>
        </div>

        










<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>



