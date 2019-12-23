<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script src="userLogin.js"></script>

<form action="home2.jsp" method="post" onsubmit="return validate2()">
  <input type="radio" name="gender" value="male" checked> Male<br>
  <input type="radio" name="gender" value="female"> Female<br>
  <input type="radio" name="gender" value="other"> Other <br> 
  
  <select name="cars" id="cars">
  <option value="select">Select</option>
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="fiat">Fiat</option>
  <option value="audi">Audi</option>
</select>
<br>
Phone:<input type="text" name="phone" id="phone"> <br>
Name:<input type="text" name="name" id="name"><br>


  <input type="submit">
</form> 



</body>
</html>