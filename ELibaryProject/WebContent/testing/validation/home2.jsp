<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

<%
String b=request.getParameter("gender");
String c=request.getParameter("cars");

%>
<form >

<input type="radio" name="gender" value="male" <%if(b.equals("male")){ %>checked<%} %>> Male<br>
<input type="radio" name="gender" value="female" <%if(b.equals("female")){ %>checked<%} %>> Female<br>
<input type="radio" name="gender" value="other" <%if(b.equals("other")){ %>checked<%} %>> Other  


<select name="cars">
  <option value="select">Select</option>
  <option value="volvo" <%if(c.equals("volvo")){%> selected="selected" <% } %>>Volvo</option>
  <option value="saab" <%if(c.equals("saab")){%> selected="selected" <% } %>>Saab</option>
  <option value="fiat" <%if(c.equals("fiat")){%> selected="selected" <% } %> >Fiat</option>
  <option value="audi" <%if(c.equals("audi")){%> selected="selected" <% } %>>Audi</option>
</select>


</form>


</body>
</html>