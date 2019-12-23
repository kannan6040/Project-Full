<%@ page language="java" contentType="text/html; charset=ISO-8859-1"


    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.bl.*,com.dto.*" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Users</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/userviewallbook.css">

          <link rel="stylesheet" type="text/css" href="../includes/css/table.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


 
  	

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



<h1 style="color: white;"> Welcome: <%=(String)session.getAttribute("admin_name") %></h1>
 <h2 style="color: white; text-align: center;">User List</h2>


<br><br>
    
        <div style="background-color: white; color: black;" class="table100 ver5 m-b-110">
          
          <table data-vertable="ver5">
          <%
 //         ArrayList<Book> books=null;
 		  ArrayList<User> users=UserBl.getUsers();
		 if(users!=null && (users.size()>0))
				  {
								  
		%>
            
              <tr style=" color: black;"  class="row100 head">
                <th class="column100 column2" >Email Id</th>
                <th class="column100 column2" >User Name</th>
                <th class="column100 column3" >Occupation</th>
                <th class="column100 column8" >Action</th>
                
              </tr>
           
            <tbody>
             <%
		       for(User user : users)
					{
		    %>


              <tr class="row100">
                <td class="column100 column2" ><%= user.getEmailId() %></td>
                <td class="column100 column2" ><%= user.getUserName() %></td>
                <td class="column100 column3" ><%= user.getOccupation() %></td>
                
                <td class="column100 column9" >
                <a href="deleteuser.jsp?emailId=<%=user.getEmailId()%>" >Delete</a>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 <a href="suspenduser.jsp?emailId=<%=user.getEmailId()%>" >Suspend</a>
                
                </td>
              </tr>
              <%
					  }
						  }
							          else
							          {
							        	  %>
							        	  
							         <tr class="row100">
                <td  colspan="10" align="center"> <span >No Users Found </span> </td>
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



