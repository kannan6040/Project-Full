package com.bl;

import java.util.ArrayList;

import com.dl.*;
import com.dto.*;

public class AdminBl 
{
	
	public static Admin validateAdmin(Admin admin1)
	{
		Admin admin2=null;
		
		try
		{
			admin2=AdminDl.validateAdmin(admin1);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminBL:validateAdmin "+e.getMessage());
		}
		
	return admin2;
	}
	
	public static int addAdmin(Admin admin)
	{
		int result=0;
			
		try
		{
			
			
			
			 result = AdminDl.addAdmin(admin);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminBL:addAdmin "+e.getMessage());
		}
		
	return result;
	}
	
	public static int deleteAdmin(String emailid)
	{
		int result=0;
			
		try
		{
			
			
			 result = AdminDl.deleteAdmin(emailid);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminBL:deleteAdmin "+e.getMessage());
		}
		
	return result;
	}
	
	public static Admin getAdmin(String emailid)
	{
		Admin admin=null;
		
		try
		{
			admin = AdminDl.getAdmin(emailid);
			        
	    }
	   
		catch(Exception e)
		{
			System.out.println("**Error** AdminBL:getAdmin "+e.getMessage());
		}
		return admin;	
	
	}
	
	public static ArrayList<Admin> getAdmins()
	{
		ArrayList<Admin> admins=null;
		
		
		try
		{
			 
		       admins=AdminDl.getAdmins();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminBL:getAdmins "+e.getMessage());
		}
		
	return admins;
	}
	
	public static int updateAdmin(Admin admin)
	{
		int result=0;
		
		
		try
		{
			result=AdminDl.updateAdmin(admin);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminBL:updateAdmin "+e.getMessage());
		}
		
	return result;
	}
	


}
