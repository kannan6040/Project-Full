
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
        <title>Update User Information</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/userupdate.css">

 
  	

<style type="text/css">
    #eusername, #epassword, #econfirmpassword, #ephone, #estate,#eaddress,#eage,#eoccupation{color :red;}
</style>

        
    </head>
<html>    
    <body>
      <script src="../includes/js/verify.js"></script>
      

<nav style="background: rgba(0,0,0,.8);height: 70px;"  class="navbar navbar-inverse">
  <div  style="font-size: 20px;" class="container-fluid">
  


    <div class="navbar-header">
      <a   class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul   class="nav navbar-nav">
     
      <li class="active"><a href="userhome.jsp">Home</a></li>
      
      

      <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Books<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8);" class="dropdown-menu">
          <li><a style="color: grey; " href="../Book/userbooksearch.jsp">Search Books</a></li>
          <li><a style="color: grey;" href="../Book/userviewallbook.jsp">View Books</a></li>
          <li><a style="color: grey;" href="../Book/userfavoritebooks.jsp">Recommended Books</a></li>
          <li><a style="color: grey;" href="http://localhost:8090/spring_mvc_reqbook/index.jsp">Request A Book</a></li>
          
        </ul>
      </li>
      
      
     

     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">My Account<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8); " class="dropdown-menu">
          <li><a style="color: grey; " href="userupdate.jsp">Modify Account</a></li>
          <li><a style="color: grey;" href="userdelete.jsp" onclick="return confirm('Do you want to Delete and Logout?')">Delete Account</a></li>
          
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
String message="";

String password="";
String confirmPassword="";
String emailId="";


String username="";
String phone="";
String gender="";
String occupation="";
String tempAddress="";
String address="";
String state="";
int age=0;
String sAge="";

User user=null;
boolean errorFlag=false;

%>

<%
if(request.getParameter("submit")==null)
{
	message="";
}
emailId=(String)session.getAttribute("user_email");



	user=UserBl.getUser(emailId);
	username=user.getUserName();
	password=user.getPassword();
	confirmPassword=user.getPassword();
	phone=user.getPhone();
	gender=user.getGender();
	occupation=user.getOccupation();
	address=user.getAddress();
	state=user.getState();
	age=user.getAge();
	sAge=""+age;
	
	if(request.getParameter("submit")!=null)
	{
		
		 username=request.getParameter("username");
		 phone=request.getParameter("phone");
		 gender=request.getParameter("gender");
		 occupation=request.getParameter("occupation");
		 tempAddress=request.getParameter("address");
		 address=tempAddress.trim();
		 password=request.getParameter("password");
		 state=request.getParameter("state");
		 sAge=(request.getParameter("age"));
		 
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
		 if(gender.equals(""))
		  {
			  errorFlag=true;
		  }
		 if(occupation.equals("select"))
		  {
			  errorFlag=true;
		  }
		 if(address.equals(""))
		  {
			  errorFlag=true;
		  }
		 if(state.equals("select"))
		  {
			  errorFlag=true;
		  }
		 if(sAge.equals(""))
		  {
			  errorFlag=true;
		  }
		 
		 if(errorFlag==false)
		 {
			 User user2=new User();
			 user2.setUserName(username);
			 user2.setAddress(address);
			 user2.setAge(Integer.parseInt(sAge));
			 user2.setEmailId(emailId);
			 user2.setGender(gender);
			 user2.setOccupation(occupation);
			 user2.setPhone(phone);
			 user2.setState(state);
			 user2.setPassword(password);
			 
			 int result=0;
			 
			 result=UserBl.updateUser(user2);
			 if(result>0)
			 {
				 message="Successfully Updated";
				 session.setAttribute("user_name", user2.getUserName());
				 session.setAttribute("message", "User Details Modified Successfully");
				 response.sendRedirect("userhome.jsp");
				 //send message to home screen
			 }
			 else
			 {
				 message="Updation Failed";
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
            <h2>Update User Information</h2>

            <p style="color: red" align="center" id="id1"><%= message %></p>
            <form name="f2" action="#" method="post" onsubmit="return verifymodifyuser()">
                <table>
                	



                    <tr>
                	<td> <label style="color: white;">Username</label></td>
                	<td><input class="input" type="text" name="username" id="username" value='<%= username %>'></td>
                    <td><span style="color: red; visibility: hidden;" id="eusername" > Invalid Username</span></td>
                    </tr>






                	<tr>
                	<td> <label style="color: white;">Password</label></td>
                	<td><input class="input" type="password" name="password" id="password" value=<%=password %>></td>
                    <td><span style="color: red;visibility: hidden;" id="epassword">Password should be atleast 8 characters</span></td>
                    </tr>

                    
                    
                	<tr>
                	<td> <label style="color: white;">Confirm Password</label></td>
                	<td><input class="input" type="password" name="confirmpassword" id="confirmpassword" value=<%=password %>></td>
                    <td><span style="color: red;visibility: hidden;" id="econfirmpassword">Both Passwords should be same</span></td>
                    </tr>     

                   
                    <tr>
                	<td> <label style="color: white;">Phone Number</label></td>
                	<td><input  class="input"  type="text" name="phone" id="phone" value=<%=phone %>></td>
                    <td><span style="color: red;visibility: hidden;" id="ephone">Phone Number should be 10 digits</span></td>
                    </tr>


                     <tr style="color: white;">
                	<td> <label style="color: white;">Gender</label></td>
                	<td> <input type="radio" name="gender" value="male" <%if(gender.equals("male")) {%> checked <% }%> > Male&nbsp;&nbsp;&nbsp;&nbsp;
                   <input  type="radio" name="gender" value="female" <%if(gender.equals("female")) {%> checked <% }%>> Female&nbsp;&nbsp;&nbsp;&nbsp;
                   <input type="radio" name="gender" value="other" <%if(gender.equals("other")) {%> checked <% }%>> Other</td>
                    </tr>

                   

                    <tr>
                   <td> <label style="color: white;">Occupation</label></td>
                   <td>
                   	<select name="occupation" id="occupation" class="custominputstyle">
                    <option value="select" >Select</option>
                    <option value="student" <%if(occupation.equals("student")) {%> selected="selected" <% }%> >Student</option>
                    <option value="employed" <%if(occupation.equals("employed")) {%> selected="selected" <% }%>>Employed</option>
                    <option value="unemployed" <%if(occupation.equals("unemployed")) {%> selected="selected" <% }%>>Unemployed</option>
                    </select>
                </td>
                <td><span style="color: red;visibility: hidden;" id="eoccupation"> Please select an Occupation </span></td>	
                    </tr>


                    <tr>
                    	<td><label style="color: white;">Address</label></td>
                    	<td>
                    		<textarea class="textareastyle" name="address" id="address"  rows="4" cols="50" ><%=address %></textarea>
             </td>
             <td><span style="color: red; vertical-align: 45px;visibility: hidden;" id="eaddress"> Please Enter An Address</span></td>
             <tr>


             	<tr>
             		<td><label style="color: white;">State</label></td>
             		<td><select name="state" id="state" class="custominputstyle">
                    <option value="select">State</option>
                    <option value="kerala" <%if(state.equals("kerala")) {%> selected="selected" <% }%> >Kerala</option>
                    <option value="tamilnadu" <%if(state.equals("tamilnadu")) {%> selected="selected" <% }%> >TamilNadu</option>
                    <option value="andhra" <%if(state.equals("andhra")) {%> selected="selected" <% }%> >Andhra</option>
                    </select></td>

                    <td><span style="color: red;visibility: hidden;" id="estate">Please select a State</span></td>
             	</tr>


                  <tr>
                  	<td><label style="color: white;">Age</label></td>
                   <td><input style="width: 70px;" class="custominputstyle" type="text" name="age" id="age" value=<%=sAge %>></td>

                 	 <td><span style="color: red;visibility: hidden;" id="eage">Enter a valid Age</span></td>
                  </tr>





                  <tr>
                  	<td><input align="center" type="submit" name="submit" value="Update">
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



