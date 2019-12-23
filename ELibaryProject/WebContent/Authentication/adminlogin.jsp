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
        
        <title>Admin Login Form</title>
        <link rel="stylesheet" type="text/css" href="../includes/css/adminlogin.css">

<style type="text/css">
     #eemailid,#epassword{color: red;}
</style>
 </head>





<html>    
    <body>

       <script type="text/javascript" src="../includes/js/verifyadmin.js"></script>

<nav style="background: rgba(0,0,0,.8);height: 70px; font-size: 20px;"  class="navbar navbar-inverse">
  <div class="container-fluid">
  


    <div class="navbar-header">
      <a   class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul  class="nav navbar-nav">
     
      <li class="active"><a href="mainhome.jsp">Home</a></li>
      
      <li><a href="about.jsp">About</a></li>
      
      <li><a href="http://localhost:4200/employees">Feedback</a></li>


     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login As<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);  font-size: 20px;" class="dropdown-menu">
          <li><a style="color: grey;" href="userlogin.jsp">User</a></li>
          <li><a style="color: grey;" href="adminlogin.jsp">Admin</a></li>
          
        </ul>
      </li>

     </ul>

  </div>
</nav>

<% String message=""; 
                //String user_id,password;
     String emailId;
     String password;
     Admin admin1=null;
     Admin admin2=null;
     boolean errorFlag=false;
                                
  %>
<%
  if(request.getParameter("submit")!=null)
  {
	  
	  emailId=request.getParameter("emailid");
	  password=request.getParameter("password");
	  if(emailId.equals(""))
	  {
		  errorFlag=true;
	  }
	  if(password.equals(""))
	  {
		  errorFlag=true;
	  }
	  
	  if(errorFlag==false)
	  {
		  admin1=new Admin();
		  admin1.setEmailId(emailId);
		  admin1.setPassword(password);
		  
		  admin2=AdminBl.validateAdmin(admin1); 
		  if(admin2!=null)
		  {
			  session.setAttribute("admin_email", admin2.getEmailId());
    		  session.setAttribute("admin_name",admin2.getUserName());
    		  response.sendRedirect("../Admin/adminhome.jsp");//success
		  }
		  else
		  {
			  message="Invalid Credentials";
		  }
	  }
	  else
	  {
		 message="Please Enter Email ID and Password"; 
	  }
  }
  
  %>






        <div class="box">
            <h2>Admin Login</h2>

            <form name="f2" action="#" method="post" onsubmit="return verifyadminlogin()">
                
                <div class="inputBox">
                    <input type="text" name="emailid" id="emailid">&nbsp;&nbsp;<span style=" font-weight: bold; color: red;visibility: hidden;" id="eemailid" display="inline-block">Enter a valid Email ID</span>
                    <label>Email</label>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" id="password" >&nbsp;&nbsp;<span style=" font-weight: bold; color: red;visibility: hidden;" id="epassword" display="inline-block">Password should be atleast 8 characters</span>
                    <label>Password</label>
                </div>
                
                <div align="center">
                    <p style=" font-weight: bold; display: inline; color: red; "display="inline-block"><%= message %></p>

                </div>
                
                <br><br>

                <input type="submit" name="submit" value="Login">
               </form>
        </div>


<div>
    
</div>


<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>



    </body>
</html>


