<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bl.*,com.dto.*" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String emailid=request.getParameter("emailid");
Admin admin=AdminBl.getAdmin(emailid);
int status=admin.getStatus();
if(status==0)
{
	status=1;
}
else
{
	status=0;
}

Admin admin2=admin;
admin2.setStatus(status);
int result=0;
result=AdminBl.updateAdmin(admin2);
if(result>0)
{
	session.setAttribute("message", "Status Changed Succssefully");
	response.sendRedirect("adminlistsuper.jsp");
	
}
else
{

	session.setAttribute("message", "Status Change Failed");
	response.sendRedirect("adminlistsuper.jsp");
	
}

%>
</body>
</html>