package com.dl;

import com.dto.*;
import java.sql.*;
import java.util.ArrayList;


public class AdminDl 
{
	public static int addAdmin(Admin admin)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "INSERT INTO tbadmin VALUES(?,?,?,?,?)";
			
			ps=con.prepareStatement(query);
			ps.setString(1, admin.getEmailId());
			ps.setString(2, admin.getUserName());
			ps.setString(3, admin.getPassword());
			ps.setString(4, admin.getPhone());
			ps.setInt(5, 1);
			
			
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** AdminDL:addAdmin "+e.getMessage());
		}
		
	return result;
	}

	
	public static Admin validateAdmin(Admin admin1)
	{
		Connection con=null;
		Statement statement =null;
		ResultSet resultSet=null;
		Admin admin2=null;
		
		try
		{
			
			
			String sql = "SELECT * FROM TBadmin WHERE (emailid=? and PASSWORD=?) and status=?";
	        con=DBHelper.getConnection();
	       PreparedStatement ps=null;
	    	ps=con.prepareStatement(sql);
	
			ps.setString(1,admin1.getEmailId());
			ps.setString(2,admin1.getPassword());
			ps.setInt(3, 1);
			
			
			
			  resultSet =ps.executeQuery();
		
	         if(resultSet.next()) 
	         {
	        	 
	        	 admin2= new Admin();
	        	 admin2.setUserName(resultSet.getString("username"));
	        	 admin2.setEmailId(resultSet.getString("emailid"));
	        	 
	        	 
	         }
	         
	         ps.close();
		     con.close();
	        
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminDL:validateAdmin "+e.getMessage());
		}
		
	return admin2;
	}
	
	public static int deleteAdmin(String emailid)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "delete from tbadmin where emailid=?";
			
			ps=con.prepareStatement(query);
			ps.setString(1, emailid);
		
					
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** AdminDL:deleteAdmin "+e.getMessage());
		}
		
	return result;
	}
	
	public static Admin getAdmin(String emailid)
	{
		int result=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		Admin admin=null;
		try
		{
			con=DBHelper.getConnection();
			query = "select * from tbadmin where emailid='"+emailid+"'";
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        if(resultSet.next()) 
	        {
	        	 admin = new Admin();
	        	 admin.setEmailId(resultSet.getString(1));
	        	 admin.setUserName(resultSet.getString(2));
	        	 admin.setPassword(resultSet.getString(3));
	        	 admin.setPhone(resultSet.getString(4));
	        	 admin.setStatus(resultSet.getInt(5));
	        	
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** AdminDL:getAdmin "+e.getMessage());
		}
		return admin;	
	
	}
	public static ArrayList<Admin> getAdmins()//put status=0 in bl layer
	{
		ArrayList<Admin> admins=null;
		Connection con=null;
		  Statement statement =null;
		  ResultSet resultSet=null;
		  Admin admin=null;
		try
		{
			  admins = new ArrayList<Admin>();
		        String sql = "SELECT * FROM tbadmin";
		        con=DBHelper.getConnection();
		        statement = con.createStatement();
		        resultSet = statement.executeQuery(sql);
		        while (resultSet.next()) {
		        	admin = new Admin();
		        	admin.setEmailId(resultSet.getString(1));
		        	admin.setUserName(resultSet.getString(2));
		        	admin.setPassword(resultSet.getString(3));
		        	admin.setPhone(resultSet.getString(4));
		        	admin.setStatus(resultSet.getInt(5));
		        	 
		        	admins.add(admin);
		        }
		         
		        resultSet.close();
		        statement.close();
		        con.close();
		       
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminDL:getAdmins "+e.getMessage());
		}
		
	return admins;
	}
	
	public static int updateAdmin(Admin admin)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "UPDATE tbadmin SET USERNAME=?,PASSWORD=?,PHONE=?,status=? WHERE emailid=?";
			ps=con.prepareStatement(query);
		
			ps.setString(1, admin.getUserName());
			ps.setString(2, admin.getPassword());
			ps.setString(3, admin.getPhone());
			ps.setInt(4, admin.getStatus());
			ps.setString(5, admin.getEmailId());
			
			
		
			 result = ps.executeUpdate();
			 ps.close();
		     con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** AdminDL:updateAdmin "+e.getMessage());
		}
		
	return result;
	}

}
