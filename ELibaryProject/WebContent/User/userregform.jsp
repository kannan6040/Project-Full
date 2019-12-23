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
        <script src="../includes/js/verify.js"></script>
        <title>Registration Form</title>
       
        <link rel="stylesheet" type="text/css" href="../includes/css/userregform.css">

 
  	

<style type="text/css">
</style>

        
    </head>
<html>    
    <body>
      



<nav style="background: rgba(0,0,0,.8);height: 70px;"  class="navbar navbar-inverse">
  <div class="container-fluid">
  


    <div class="navbar-header">
      <a style="font-size: 17px;"  class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul style="font-size: 16px;"  class="nav navbar-nav">
     
      <li class="active"><a href="../Authentication/mainhome.jsp">Home</a></li>
      
      <li><a href="../Authentication/about.jsp">About</a></li>


     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li style=" font-size: 16px;"  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login As<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8); font-size: 16px; " class="dropdown-menu">
          <li><a style="color: grey; " href="../Authentication/userlogin.jsp">User</a></li>
          <li><a style="color: grey;" href="../Authentication/adminlogin.jsp">Admin</a></li>
          
        </ul>
      </li>

     </ul>
    


   



  </div>
</nav>




<%!

String userName="";
String phone="";
String gender="";
String occupation="";
String tempaddress="";
String address="";
String state="";
String age="";
boolean errorFlag=false;

String message="";
User user=null;


%>


<%
String emailId="";
if(request.getParameter("submit")!=null)
{
	emailId=request.getParameter("emailid");
	 userName=request.getParameter("username");
	 phone=request.getParameter("phone");
	 gender=request.getParameter("gender");
	 occupation=request.getParameter("occupation");
	 tempaddress=request.getParameter("address");
	 address=tempaddress.trim();
	 state=request.getParameter("state");
	 age=request.getParameter("age");
	 
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
	 if(age.equals(""))
	  {
		  errorFlag=true;
	  }
	 
	 if(errorFlag==false)
	 {
		 user=new User();
		 user.setUserName(userName);
		 user.setAddress(address);
		 user.setAge(Integer.parseInt(age));
		 user.setEmailId(emailId);
		 user.setGender(gender);
		 user.setOccupation(occupation);
		 user.setPhone(phone);
		 user.setState(state);
		 user.setPassword("");
		 int result=0;
		 result=UserBl.addUser(user);
		 if(result>0)
		 {
			 message="Registered Successfully";
			 //go to login page
			 %>
			 <meta http-equiv = "refresh" content = "2; url = ../Authentication/userlogin.jsp" />
		 <%}
		 else
		 {
			 message="Failed Registration";
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
            <h2>New User Registration</h2>

            <p style="color: red" align="center" id="id1"><%= message %></p>
            <form method="post" onsubmit="return userregvalidate()">
                <table>
                	


                	<tr>
                	<td> <label style="color: white;">Email ID</label></td>
                	<td><input class="input" type="text" name="emailid" id="emailid"></td>
                    <td><span style="color: red;visibility:hidden;" id="eemailid" name="eemailid"> Invalid EmailID</span></td>
                    </tr>


                    <tr>
                	<td> <label style="color: white;">Username</label></td>
                	<td><input class="input" type="text" name="username" id="username"></td>
                    <td><span style="color: red;visibility:hidden;" id="eusername"> Invalid Username</span></td>
                    </tr>



                    <tr>
                	<td> <label style="color: white;">Phone Number</label></td>
                	<td><input  class="input"  type="text" name="phone" id="phone"></td>
                    <td><span style="color: red;visibility:hidden;" id="ephone">Phone Number should be 10 digit and begin with 7,8 or 9</span></td>
                    </tr>


                     <tr style="color: white;">
                	<td> <label style="color: white;">Gender</label></td>
                	<td> <input type="radio" name="gender" value="male" checked > Male&nbsp;&nbsp;&nbsp;&nbsp;
                   <input  type="radio" name="gender" value="female"> Female&nbsp;&nbsp;&nbsp;&nbsp;
                   <br><input type="radio" name="gender" value="other"> Other</td>
                    <td></td>
                    </tr>

                   

                    <tr>
                   <td> <label style="color: white;">Occupation</label></td>
                   <td>
                   	<select class="custominputstyle" name="occupation" id="occupation">
                    <option value="select">Select</option>
                    <option value="student">Student</option>
                    <option value="employed">Employed</option>
                    <option value="unemployed">Unemployed</option>
                    </select>
                </td>
                <td><span style="color: red;visibility:hidden;" id="eoccupation"> Please select an Occupation </span></td>	
                    </tr>


                    <tr>
                    	<td><label style="color: white;">Address</label></td>
                    	<td>
                    		<textarea class="textareastyle" name="address" id="address" rows="4" cols="50">
                  
                 </textarea>
             </td>
             <td><span style="color: red; visibility:hidden;" id="eaddress" name="eaddress"> Please Enter An Address</span></td>
             <tr>


             	<tr>
             		<td><label style="color: white;">State</label></td>
             		<td><select class="custominputstyle" name="state" id="state">
                    <option value="select">Select</option>
                    <option value="kerala">Kerala</option>
                    <option value="tamilnadu">TamilNadu</option>
                    <option value="andhra">Andhra</option>
                    </select></td>

                    <td><span style="color: red;visibility:hidden;" id="estate">Please select a State</span></td>
             	</tr>


                  <tr>
                  	<td><label style="color: white;">Age</label></td>
                   <td><input style="width: 70px;" class="custominputstyle" type="text" name="age" id="age"></td>

                 	 <td><span style="color: red;visibility:hidden;" id="eage" name="eage">Enter a valid Age between 0 and 100</span></td>
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



