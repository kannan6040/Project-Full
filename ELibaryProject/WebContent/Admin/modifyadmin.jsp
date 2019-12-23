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
 #eusername, #epassword, #ephone,#enewpassword,
#econfirmpassword
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
String message="";

String password="";
String confirmPassword="";
String emailId="";


String username="";
String phone="";

int status;
Admin admin=null;
boolean errorFlag=false;

%>

<%
if(request.getParameter("submit")==null)
{
	message="";
}
emailId=(String)session.getAttribute("admin_email");


	admin=AdminBl.getAdmin(emailId);
	status=admin.getStatus();
	username=admin.getUserName();
	
	password=admin.getPassword();
	confirmPassword=admin.getPassword();
	phone=admin.getPhone();
	
	
	if(request.getParameter("submit")!=null)
	{
		
		 username=request.getParameter("username");
		 phone=request.getParameter("phone");
		 
		 password=request.getParameter("newpassword");
		 
		 if(emailId.equals(""))
		  {
			  errorFlag=true;
		  }
		 if(username.equals(""))
		  {
			  errorFlag=true;
		  }
		 if(phone.equals(""))
		  {
			  errorFlag=true;
		  }
		
		 
		 if(errorFlag==false)
		 {
			 Admin admin2=new Admin();
			 admin2.setUserName(username);
			 admin2.setPhone(phone);
			 admin2.setEmailId(emailId);
			 admin2.setStatus(status);
			 admin2.setPassword(password);
			 
			 int result=0;
			 
			 result=AdminBl.updateAdmin(admin2);
			 if(result>0)
			 {
				 message="Successfully Updated";
				 session.setAttribute("admin_name", admin2.getUserName());
				 session.setAttribute("message", "Admin Details Changed");
				 response.sendRedirect("adminhome.jsp");
				 //send message to home screen
			 }
			 else
			 {	session.setAttribute("message", "Failed to change Admin Details");
				 message="Updation Failed";
				 response.sendRedirect("adminhome.jsp");
			 }
		 }
		 else
		 {
			 message="Updation Failed";
			 //send message to home about failure
		 }
		 
	
    }


%>


<div style="height: 1000px; position: relative;">
        <div class="box">
            <h2>Modify Admin Details</h2>

            <p style="color: red" align="center" id="id1"><%=message %></p>
            <form name="f5" action="#" method="post" onsubmit="return validatemodifyadmin()">
                <table>
                	
                    <tr>
                	<td> <label style="color: white;">Email ID</label></td>
                	<td><input class="input" type="text" name="emailid" id="emailid" readonly="readonly" value=<%=emailId %>></td>
                    <td><span style="color: red; visibility: hidden;" id="eemailid">Enter a Valid E-mail Id </span></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Username</label></td>
                	<td><input class="input" type="text" name="username" id="username" value='<%=username %>'></td>
                    <td><span style="color: red;visibility: hidden;" id="eusername">Username Cannot be Null</span></td>
                    </tr>

                    <tr>
                	<td> <label style="color: white;">New Password</label></td>
                	<td><input class="input" type="password" name="newpassword" id="newpassword" value=<%=password %>></td>
                    <td><span style="color: red;visibility: hidden;" id="enewpassword">Password Should be atleast 8 Characters</span></td>
                    </tr>


                    <tr>
                  <td> <label style="color: white;">Confirm Password</label></td>
                  <td><input class="input" type="password" name="confirmpassword" id="confirmpassword" value=<%=password%>></td>
                    <td><span style="color: red;visibility: hidden;" id="econfirmpassword">Both the passwords should be same</span></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Phone Number</label></td>
                	<td><input  class="input"  type="text" name="phone" id="phone" value=<%=phone %>></td>
                    <td><span style="color: red;visibility: hidden;" id="ephone"> Invalid Phone Number</span></td>
                    </tr>


                  <tr>
                  	<td><input align="center" type="submit" name="submit" value="Update Details">
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



