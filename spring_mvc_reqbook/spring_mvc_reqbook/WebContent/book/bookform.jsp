<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    


<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  
  
  
  <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <title>Login Form</title>
        <link rel="stylesheet" type="text/css" href="login1.css">

<style type="text/css">


<body background="${pageContext.request.contextPath}/resources/lib.jpg"> 

body {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
    background: url(lib.jpg);
    background-size: cover;
}

.box {
    
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 700px;
    padding: 40px;
    background: rgba(0,0,0,.8);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0,0,0,.5);
    border-radius: 10px;
}
.box h2
   {
   margin: 0 0 30px;
    padding: 0;
    color: #fff;
    color: darkseagreen;
    text-align: center;
}

.box .inputBox {
    position: relative;
}

.box .inputBox input {
    width: 60%;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    margin-bottom: 30px;
    border: none;
    border-bottom: 1px solid #fff;
    outline: none;
    background: transparent;
}

.box .inputBox label {
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    pointer-events: none;
    transition: .5s; 
}



.box .inputBox input:focus ~ label,
.box .inputBox input:valid ~ label {
    top: -20px;
    left: 0;
    color: #03a9f4;
    font-size: 12px;
}


.box input[type="submit"] {
    background: transparent;
    border: none;
    outline: none;
    color: #fff;
    background: #03a9f4;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
}

.button {


  background-color: #03a9f4;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
border-radius: 8px;
}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   height: 70px;
   color: white;
   text-align: center;
   background: rgba(0,0,0,.8);
}

.error{color:red;}

	
</style>
 </head>





<html>    

<body background="${pageContext.request.contextPath}/resources/lib.jpg"> 




<nav style="background: rgba(0,0,0,.8);height: 70px;font-size: 20px; "  class="navbar navbar-inverse">
  <div class="container-fluid">
  


    <div class="navbar-header">
      <a   class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul   class="nav navbar-nav">
     
      <li class="active"><a href="http://localhost:8090/ELibaryProject/User/userhome.jsp">Home</a></li>
      

     </ul>



    <ul class="nav navbar-nav navbar-right">
     

     <li><a href="http://localhost:8090/ELibaryProject/Authentication/logout.jsp">Logout</a>
     </li>
      

     </ul>
    


   



  </div>
</nav>







        <div class="box">
        
<h1 align="center" style="color:white;">Request New Book</h1>  
       <form:form method="post" action="save" modelAttribute="book">    
        <table width="300px" >    
         
         <tr>    
          <td style="color:white; width:130px;">BookName:</td>
           <td><form:input style="background: rgba(0,0,0,.8); color:white;" path="bookname"  />
           <form:errors path="bookname" style="position:absolute; left:348px;" cssClass="error"/></td>
         </tr>    
          
         
        
         <tr>    
          <td style="color:white; width:130px;">AuthorName:</td>    
          <td><form:input style="background: rgba(0,0,0,.8); color:white;" path="authorname" />
          <form:errors path="authorname" style="position:absolute; left:348px;" cssClass="error"/></td>
         </tr>   
        
         <tr>    
          <td style="color:white; width:130px;">PublishedYear:</td>    
          <td><form:input style="background: rgba(0,0,0,.8); color:white;" path="publishedyear" />
          <form:errors path="publishedyear" style="position:absolute; left:348px;" cssClass="error"/></td> 
         </tr>   
       
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Save" /></td>    
         </tr>
             
        </table>    
       </form:form>    
        
        
        
               </div>


<div>
    
</div>


<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>



    </body>
</html>


  
