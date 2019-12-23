<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");
	PreparedStatement ps=conn.prepareStatement("select bookcontent from tbbook where bookid=?");
	ps.setInt(1, 22);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		Blob blob=rs.getBlob(1);
		byte byteArray[]=blob.getBytes(1,(int)blob.length());
		response.setContentType("application/pdf");
		OutputStream os=response.getOutputStream();
		os.write(byteArray);
		os.flush();
		os.close();
	}
	

}
catch(Exception e)
{
	e.printStackTrace();
}


%>

</body>
</html>