package spring_mvc_Elibrary.dao;


import java.sql.*;

public class DBHelper {
	
	
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{
			
			
		Class.forName("oracle.jdbc.driver.OracleDriver");   
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","project");    
		
		}
		catch(Exception e)
		{
			System.out.println("**Error** : DBHelper:getConnection " +e.getMessage());
			
		}
		return con;
	}
	

}
