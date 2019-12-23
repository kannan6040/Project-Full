<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bl.*,com.dto.*" %>
<!DOCTYPE html>
<html>
    <head>s
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Admin Registration Form</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/adminreg.css">

 
  	

<style type="text/css">
#eemailid, #eusername, #epassword, #ephone
{
  color: red;
}
</style>

        
    </head>
<html>    
    <body>
      <script type="text/javascript" src="../includes/js/validateAdminReg.js"></script>




<nav style="background: rgba(0,0,0,.8);height: 70px; margin-top: -20px;"   class="navbar navbar-inverse">
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



<%!
String emailId="";
String userName="";
String password="";
String phone="";

boolean errorFlag=false;

String message="";
Admin admin=null;


%>


<%
if(request.getParameter("submit")!=null)
{
	emailId=request.getParameter("emailid");
	 userName=request.getParameter("username");
	 phone=request.getParameter("phone");
	 password=request.getParameter("password");
	 
	 if(emailId.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(userName.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(phone.equals(""))
	  {
		  errorFlag=true;
	  }
	 if(password.equals(""))
	  {
		  errorFlag=true;
	  }
	
	 
	 if(errorFlag==false)
	 {
		 Admin admin=new Admin();
		 admin.setEmailId(emailId);
		 admin.setPassword(password);
		 admin.setPhone(phone);
		 admin.setUserName(userName);
		 
		 int result=0;
		 result=AdminBl.addAdmin(admin);
		 if(result>0)
		 {
			 session.setAttribute("message", "New Admin Added");
			 response.sendRedirect("adminhome.jsp");


		 }
		 else
		 {
			 session.setAttribute("message", "Admin addiion Failed");
			 response.sendRedirect("adminhome.jsp");
		 }
		 
		 
		 
	 }
	 else
	 {
		 message="Failed Registration";
	 }
	
}



%>




<div style="height: 1000px; position: relative;">
        <div class="box">
            <h2>New Admin Registration</h2>

            <p style="color: red" align="center" id="id1"><%=message%></p>
            <form name="f5" action="#" method="post" onsubmit="return validateAdminReg()">
                <table>
                	
                    <tr>
                	<td> <label style="color: white;">Email ID</label></td>
                	<td><input class="input" type="text" name="emailid" id="emailid"></td>
                    <td><span style="color: red; visibility: hidden;" id="eemailid">Enter a Valid E-mail Id </span></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Username</label></td>
                	<td><input class="input" type="text" name="username" id="username"></td>
                    <td><span style="color: red;visibility: hidden;" id="eusername">Username Cannot be Null</span></td>
                    </tr>

                    <tr>
                	<td> <label style="color: white;">Password</label></td>
                	<td><input class="input" type="password" name="password" id="password"></td>
                    <td><span style="color: red;visibility: hidden;" id="epassword">Password Should be atleast 8 Characters</span></td>
                    </tr>
                    
                    <tr>
                	<td> <label style="color: white;">Confirm Password</label></td>
                	<td><input class="input" type="password" name="confirmpassword" id="confirmpassword"></td>
                    <td><span style="color: red;visibility: hidden;" id="econfirmpassword">Both passwords should be same</span></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Phone Number</label></td>
                	<td><input  class="input"  type="text" name="phone" id="phone"></td>
                    <td><span style="color: red;visibility: hidden;" id="ephone"> Invalid Phone Number</span></td>
                    </tr>


                  <tr>
                  	<td><input align="center" type="submit" name="submit" value="Register">
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



