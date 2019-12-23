package com.dl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dto.*;

public class RequestDl 
{
	public static ArrayList<Request> getRequests()//put status=0 in bl layer
	{
		ArrayList<Request> requests=null;
		Connection con=null;
		  Statement statement =null;
		  ResultSet resultSet=null;
		  Request request=null;
		try
		{
			  requests = new ArrayList<Request>();
		        String sql = "SELECT * FROM TBREQUESTBOOK";
		        con=DBHelper.getConnection();
		        statement = con.createStatement();
		        resultSet = statement.executeQuery(sql);
		        while (resultSet.next()) {
		        	request = new Request();
		        	request.setRequestId(resultSet.getInt(1));
		        	request.setBookName(resultSet.getString(2));
		        	request.setAuthorName(resultSet.getString(3));
		        	request.setPublishedYear(resultSet.getInt(4));
		        	
		        	 
		        	requests.add(request);
		        }
		         
		        resultSet.close();
		        statement.close();
		        con.close();
		       
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** RequestDL:getRequests "+e.getMessage());
		}
		
	return requests;
	}
	
	public static int readRequest(int requestId)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "delete from TBREQUESTBOOK where REQUESTID=?";
			
			ps=con.prepareStatement(query);
			ps.setInt(1, requestId);
		
					
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** RequestDL:readRequest "+e.getMessage());
		}
		
	return result;
	}
	
	

}
