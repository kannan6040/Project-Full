
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  
  
  <html>
    <head>
        <title>User Table</title>
       
        <link rel="stylesheet" type="text/css" href="usertable.css">

          <link rel="stylesheet" type="text/css" href="main.css">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


 
  	

<style type="text/css">
<body background="${pageContext.request.contextPath}/resources/lib.jpg"> 
body {
    margin:0;
    padding:0;
    font-family:sans-serif;
    background: url(lib.jpg);
    background-size:cover;
    height: 100%;


}


table, td, th {  
  
  
}

table {
  border-collapse:collapse;
  width:100%;
}

th, td {
  padding:15px;
}

.box {
    position:absolute;
    top:53%;
    left:50%;
    border-bottom:50%;
    transform:translate(-50%, -50%);
    width:50%;
    padding:40px;
    padding-bottom:40px;
    background:rgba(0,0,0,.8);
    box-sizing:border-box;
    box-shadow:0 15px 25px rgba(0,0,0,.5);
    border-radius:10px;
}
.box h2
   {
   margin:0 0 30px;
    padding:0;
    color :#fff;
    color :darkseagreen;
    text-align :center;
}




.radiodiv
{

    padding :10px 0;
    font-size :16px;
    color: #fff;

}


.textareastyle
{
  border: 2px solid #765942; 
  border-radius :10px; 
  height :100px; width :75%; 
  color :white; 
  background :transparent; 
    resize :none;
    text-align:left;
    align-content :left;
}

.custominputstyle
{
   width:75%;
    padding :10px 0;
    font-size :16px;
    color :darkgrey;
    margin-bottom: 30px;
    border: none;
    border-bottom :1px solid #fff;
    outline: none;
    background :transparent;
}

.input
{   width :75%;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    margin-bottom :30px;
    border :none;
    border-bottom :1px solid #fff;
    outline: none;
    background :transparent;

}

input[type=button], input[type=submit], input[type=reset] 
{
  background-color: #03a9f4;
  border :none;
  border-radius: 8px;
  color :white;
  padding :16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor :pointer;

}


.footer {
   
   
   width: 100%;
   height: 70px;
   margin-top:113px; 
   color:white;
   text-align:center;
   background:rgba(0,0,0,.8);
   
}

/*////////TABLE///////////VTABLE/////////////TABLE/////////////TABLE///////////////TABLE//////TABLE*/




/* ------------------------------------ */
a {
  margin: 0px;
  transition: all 0.4s;
  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
}

a:focus {
  outline: none !important;
}

a:hover {
  text-decoration: none;
}

/* ------------------------------------ */
h1,h2,h3,h4,h5,h6 {margin: 0px;}

p {margin: 0px;}

ul, li {
  margin: 0px;
  list-style-type: none;
}


/* ------------------------------------ */
input {
  display: block;
  outline: none;
  border: none !important;
}

textarea {
  display: block;
  outline: none;
}

textarea:focus, input:focus {
  border-color: transparent !important;
}

/* ------------------------------------ */
button {
  outline: none !important;
  border: none;
  background: transparent;
}

button:hover {
  cursor: pointer;
}

iframe {
  border: none !important;
}



/*//////////////////////////////////////////////////////////////////
[ Table ]*/

.limiter {
  width: 100%;
  margin: 0 auto;
}

.container-table100 {
  width: 100%;
  min-height: 100vh;
  

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  padding: 33px 30px;
}

.wrap-table100 {
  width: 1300px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
table {
  width: 100%;
  background-color: #fff;
}

th, td {
  font-weight: unset;
  padding-right: 10px;
}

.column100 {
  width: 130px;
  padding-left: 25px;
}

.column100.column1 {
  width: 265px;
  padding-left: 42px;
}

.row100.head th {
  padding-top: 24px;
  padding-bottom: 20px;
}

.row100 td {
  padding-top: 18px;
  padding-bottom: 14px;
}


.table100.ver5 tbody tr:nth-child(even) {
  background-color: #e9faff;
}

.table100.ver5 td {
  font-family: Montserrat-Regular;
  font-size: 14px;
  color: black;
  line-height: 1.4;
  position: relative;
}

.table100.ver5 th {
  font-family: Montserrat-Medium;
  font-size: 12px;
  color: #fff;
  line-height: 1.4;
  text-transform: uppercase;

  background-color: #002933;
}

.table100.ver5 .row100:hover td {
  color: #fe3e64;
}

.table100.ver5 .hov-column-ver5 {color: #fe3e64;}
.table100.ver5 .hov-column-ver5::before {
  content: "";
  display: block;
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  pointer-events: none;
  border-left: 1px solid #f2f2f2;
  border-right: 1px solid #f2f2f2;
}

.table100.ver5 .hov-column-head-ver5 {
  background-color: #1a3f48 !important;
  color: #fe3e64;
}

.table100.ver5 .row100 td:hover {
  color: #fe3e64;
}

.table100.ver5 .row100 td:hover:before {
  content: "";
  display: block;
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  pointer-events: none;
  border: 1px solid #fe3e64;
}


</style>

        
    </head>
<html>    
    
    <body background="${pageContext.request.contextPath}/resources/lib.jpg">  



<nav style="background: rgba(0,0,0,.8);height: 70px;"  class="navbar navbar-inverse">
  <div  style="font-size: 20px;" class="container-fluid">
  


    <div class="navbar-header">
      <a   class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul   class="nav navbar-nav">
     
      <li class="active"><a href="http://localhost:8090/ELibaryProject/User/userhome.jsp">Home</a></li>
      

     </ul>



    <ul class="nav navbar-nav navbar-right">
     
      
      <li><a href="http://localhost:8090/ELibaryProject/Authentication/logout.jsp">Logout</a></li>
     
     </ul>
    

  </div>
</nav>




<!-- <h1 style="color: white;">Welcome User</h1>  -->
<h2 style="color: white; text-align: center;">Requested Books</h2>


<br><br>
    
        <div style="background-color: white; color: black;" class="table100 ver5 m-b-110">
  
  
<!-- <h1 align="center">Book List</h1> -->
          
          <table data-vertable="ver5">
            
            
           
              <tr style=" color: black;"  class="row100 head">
                <th class="column100 column1" >Request Id</th>
                <th class="column100 column2" >Book Name</th>
                <th class="column100 column3" >Author Name</th>
                <th class="column100 column4">Published Year</th>
                <th class="column100 column5" >Edit</th>
                <th class="column100 column6" >Delete</th>
               
              </tr>
            
            <tbody>

        <c:forEach var="book" items="${list}">
              <tr class="row100">
                <td class="column100 column1" >${book.requestid}</td>
                <td class="column100 column2" >${book.bookname}</td>
                <td class="column100 column3" >${book.authorname}</td>
                <td class="column100 column4" >${book.publishedyear}</td>
                <td class="column100 column5" ><a href="editbook/${book.requestid}">Edit</a></td>
                <td class="column100 column6" ><a href="deletebook/${book.requestid}">Delete</a></td>
                </tr>
               </c:forEach>  

            </tbody>
          </table>
          
           <br/>  
   <a href="bookform">Request New Book</a>  
          
        </div>

        










<div class="footer">
  <p style="font-weight: bold;color: grey;"> Copyright © 2019, All Rights Reserved </p>
</div>







    </body>
</html>


