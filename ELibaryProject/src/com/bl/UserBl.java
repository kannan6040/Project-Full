package com.bl;
import com.dto.*;


import java.sql.*;
import java.util.ArrayList;

import com.dl.*;

public class UserBl 
{
	public static User validateUser(User user1)
	{
		User user2=null;
		
		try
		{
			user2=UserDl.validateUser(user1);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:validateUser "+e.getMessage());
		}
		
	return user2;
	}
	
	public static int addUser(User user)
	{
		int result=0;
			
		try
		{
			user.setStatus(0);// initially status is 0
			user.setPassword("null");
			
			 result = UserDl.addUser(user);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:addUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static int deleteUser(String emailid)
	{
		int result=0;
			
		try
		{
			
			
			 result = UserDl.deleteUser(emailid);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:deleteUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static User getUser(String emailid)
	{
		User user=null;
		
		try
		{
			user = UserDl.getUser(emailid);
			        
	    }
	   
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:getUser "+e.getMessage());
		}
		return user;	
	
	}
	
	public static ArrayList<User> getUsers()
	{
		ArrayList<User> users=null;
		
		
		try
		{
			 
		       users=UserDl.getUsers();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:getUsers "+e.getMessage());
		}
		
	return users;
	}
	
	public static int updateUser(User user)
	{
		int result=0;
		
		
		try
		{
			result=UserDl.updateUser(user);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:updateUser "+e.getMessage());
		}
		
	return result;
	}
	public static int approveUser(String emailid)
	{
		int result=0;
		int result2=0;
		int result3=0;
		String password=null;
		User user=null;
		User user2=null;
		
		
		try
		{
				 password=UserDl.generateRandomString(10);
				 user=new User();
				 user=UserDl.getUser(emailid);
				 user.setPassword(password);
				 result=UserDl.updateUser(user);
				 if(result>0)
				 {
					 try
					 {
						 result2= UserDl.generateAndSendEmail(user.getEmailId(), user.getUserName(), password);
						 if(result2>0)
						 {
						 result3 = UserDl.approveUser(emailid);
						 }
						
					 }
					 catch (Exception e) 
					 {
						System.out.println("**Error** UserBL:approveUserEmailSending "+e.getMessage());
					}
				 }
				 
				 
			 
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:approveUser "+e.getMessage());
		}
		
	return result3;
	}
	public static int denyUser(String emailid)
	{
		int result=0;
			
		try
		{
			
			
			 result = UserDl.deleteUser(emailid);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:denyUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static int deactivateUser(String emailid)
	{
		int result=0;
		
		
		try
		{
			result=UserDl.deactivateUser(emailid);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:deactivateUser "+e.getMessage());
		}
		
	return result;
	}
	public static ArrayList<User> getUsersApprovalList()
	{
		ArrayList<User> users=null;
		
		
		try
		{
			 
		       users=UserDl.getUsesrApprovalList();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserBL:getUsersApprovalList "+e.getMessage());
		}
		
	return users;
	}
	

	public static void main(String[] args) 
	{
		
		System.out.println(UserBl.approveUser("anupamas770@gmail.com"));
	
	}
	

}
