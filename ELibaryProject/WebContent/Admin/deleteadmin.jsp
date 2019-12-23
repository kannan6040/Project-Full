<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bl.*,com.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String emailId=(String)session.getAttribute("admin_email");
if(emailId.equals("superadmin@elibrary.com"))
{
	session.setAttribute("message", "Cannot Delete Super Admin");
	response.sendRedirect("adminhome.jsp");
}
else
{
	int result=0;
	result=AdminBl.deleteAdmin(emailId);
	if(result>0)
	{
		session.setAttribute("message", "Deletion Success");
		response.sendRedirect("../Authentication/logout.jsp");
	}
	else
	{
		session.setAttribute("message", "Failed to Delete");
		response.sendRedirect("adminhome.jsp");
	}
}



%>

</body>
</html>