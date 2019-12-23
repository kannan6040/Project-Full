package com.bl;
import java.util.ArrayList;
import com.dl.*;
import com.dto.*;

public class RequestBl
{
	public static int readRequest(int requestId)
	{
		int result=0;
			
		try
		{
			
			
			 result = RequestDl.readRequest(requestId);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** RequestBL:readRequest "+e.getMessage());
		}
		
	return result;
	}
	
	public static ArrayList<Request> getRequests()
	{
		ArrayList<Request> requests=null;
		
		
		try
		{
			 
		       requests=RequestDl.getRequests();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** RequestBL:getRequests "+e.getMessage());
		}
		
	return requests;
	}

}
