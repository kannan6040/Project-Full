package com.dl;
import com.dto.*;


import java.security.SecureRandom;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class UserDl 
{
	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;
	public static int addUser(User user)//put status=0 in bl layer
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "INSERT INTO tbuser VALUES(?,?,?,?,?,?,?,?,?,?)";
			
			ps=con.prepareStatement(query);
			ps.setString(1, user.getEmailId());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getState());
			ps.setString(7, user.getGender());
			ps.setString(8, user.getOccupation());
			
			ps.setInt(9, user.getAge());
			ps.setInt(10, user.getStatus());
			
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** UserDL:addUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static User validateUser(User user1)
	{
		Connection con=null;
		Statement statement =null;
		ResultSet resultSet=null;
		User user2=null;
		
		try
		{
			
			
			String sql = "SELECT * FROM TBUSER WHERE (emailid=?and PASSWORD=?) and status=?";
	        con=DBHelper.getConnection();
	       PreparedStatement ps=null;
	    	ps=con.prepareStatement(sql);
	
			ps.setString(1,user1.getEmailId());
			ps.setString(2,user1.getPassword());
			ps.setInt(3, 1);
			
			
			
			  resultSet =ps.executeQuery();
		
	         if(resultSet.next()) 
	         {
	        	 
	        	 user2= new User();
	        	 user2.setUserName(resultSet.getString("username"));
	        	 user2.setEmailId(resultSet.getString("emailid"));
	        	 
	        	 
	         }
	         
	         ps.close();
		     con.close();
	         
	        
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserDL:validateUser "+e.getMessage());
		}
		
	return user2;
	}

	public static int deleteUser(String emailid)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "delete from tbuser where emailid=?";
			
			ps=con.prepareStatement(query);
			ps.setString(1, emailid);
		
					
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** UserDL:deleteUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static User getUser(String emailid)
	{
		int result=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		User user=null;
		try
		{
			con=DBHelper.getConnection();
			query = "select * from tbuser where emailid='"+emailid+"'";
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        if(resultSet.next()) 
	        {
	        	 user = new User();
	        	 user.setEmailId(resultSet.getString(1));
	        	 user.setUserName(resultSet.getString(2));
	        	 user.setPassword(resultSet.getString(3));
	        	 user.setPhone(resultSet.getString(4));
	        	 user.setAddress(resultSet.getString(5));
	        	 user.setState(resultSet.getString(6));
	        	 user.setGender(resultSet.getString(7));
	        	 user.setOccupation(resultSet.getString(8));
	        	 user.setAge(resultSet.getInt(9));
	        	 user.setStatus(resultSet.getInt(10));
			        
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** UserDL:getUser "+e.getMessage());
		}
		return user;	
	
	}
	
	public static ArrayList<User> getUsers()//put status=0 in bl layer
	{
		ArrayList<User> users=null;
		Connection con=null;
		  Statement statement =null;
		  ResultSet resultSet=null;
		  User user=null;
		try
		{
			  users = new ArrayList<User>();
		        String sql = "SELECT * FROM tbuser where status=1";
		        con=DBHelper.getConnection();
		        statement = con.createStatement();
		        resultSet = statement.executeQuery(sql);
		        while (resultSet.next()) {
		        	user = new User();
		        	 user.setEmailId(resultSet.getString(1));
		        	 user.setUserName(resultSet.getString(2));
		        	 user.setPassword(resultSet.getString(3));
		        	 user.setPhone(resultSet.getString(4));
		        	 user.setAddress(resultSet.getString(5));
		        	 user.setState(resultSet.getString(6));
		        	 user.setGender(resultSet.getString(7));
		        	 user.setOccupation(resultSet.getString(8));
		        	 user.setAge(resultSet.getInt(9));
		        	 user.setStatus(resultSet.getInt(10));
		            users.add(user);
		        }
		         
		        resultSet.close();
		        statement.close();
		        con.close();
		       
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserDL:getUsers "+e.getMessage());
		}
		
	return users;
	}
	
	public static int updateUser(User user)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "UPDATE tbuser SET USERNAME=?,PASSWORD=?,PHONE=?,ADDRESS=?,STATE=?,GENDER=?,OCCUPATION=?,AGE=? WHERE emailid=?";
			ps=con.prepareStatement(query);
		
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getState());
			ps.setString(6, user.getGender());
			ps.setString(7, user.getOccupation());
			ps.setInt(8, user.getAge());
			ps.setString(9, user.getEmailId());
			
			
			 result = ps.executeUpdate();
			 ps.close();
		     con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserDL:updateUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static int approveUser(String emailid)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "UPDATE tbuser SET status=? WHERE emailid=?";
			ps=con.prepareStatement(query);
		
			
			ps.setInt(1, 1);
			ps.setString(2, emailid);
			
			
			 result = ps.executeUpdate();
			 ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserDL:approveUser "+e.getMessage());
		}
		
	return result;
	}
	public static String generateRandomString(int length) 
    {
    	 final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    	    final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    	   final String NUMBER = "0123456789";

    	   final String DATA_FOR_RANDOM_STRING = CHAR_LOWER + CHAR_UPPER + NUMBER;
    	  SecureRandom random = new SecureRandom();
        if (length < 1) throw new IllegalArgumentException();

        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {

			// 0-62 (exclusive), random returns 0-61
            int rndCharAt = random.nextInt(DATA_FOR_RANDOM_STRING.length());
            char rndChar = DATA_FOR_RANDOM_STRING.charAt(rndCharAt);

            // debug
            //System.out.format("%d\t:\t%c%n", rndCharAt, rndChar);

            sb.append(rndChar);

        }

        return sb.toString();

    }
	
	public static int generateAndSendEmail(String receiverMailId,String userName,String password) throws AddressException, MessagingException 
	{
		
		int result=0;
		 
		// Step1
		System.out.println("\n 1st ===> setup Mail Server Properties..");
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
		//System.out.println("Mail Server Properties have been setup successfully..");
 
		// Step2
		System.out.println("\n\n 2nd ===> get Mail Session..");
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverMailId));
		//generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("rahuldraj1993@gmail.com"));
		generateMailMessage.setSubject("Hello "+userName);
		String emailBody = "The password for your Library Acocunt is "+password;
		generateMailMessage.setContent(emailBody, "text/html");
		//System.out.println("Mail Session has been created successfully..");
 
		// Step3
	System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");
 
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", "elibrarykeltron@gmail.com", "keltron1234");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		result=1;
		transport.close();
		return result;
	}
	
	public static int deactivateUser(String emailid)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "UPDATE tbuser SET status=? WHERE emailid=?";
			ps=con.prepareStatement(query);
		
			
			ps.setInt(1, 0);
			ps.setString(2, emailid);
			
			
			 result = ps.executeUpdate();
			 ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserDL:deactivateUser "+e.getMessage());
		}
		
	return result;
	}
	
	public static ArrayList<User> getUsesrApprovalList()
	{
		ArrayList<User> users=null;
		Connection con=null;
		  Statement statement =null;
		  ResultSet resultSet=null;
		  User user=null;
		try
		{
			  users = new ArrayList<User>();
		        String sql = "SELECT * FROM tbuser where status=0";
		        con=DBHelper.getConnection();
		        statement = con.createStatement();
		        resultSet = statement.executeQuery(sql);
		        while (resultSet.next()) {
		        	user = new User();
		        	 user.setEmailId(resultSet.getString(1));
		        	 user.setUserName(resultSet.getString(2));
		        	 user.setPassword(resultSet.getString(3));
		        	 user.setPhone(resultSet.getString(4));
		        	 user.setAddress(resultSet.getString(5));
		        	 user.setState(resultSet.getString(6));
		        	 user.setGender(resultSet.getString(7));
		        	 user.setOccupation(resultSet.getString(8));
		        	 user.setAge(resultSet.getInt(9));
		        	 user.setStatus(resultSet.getInt(10));
		            users.add(user);
		        }
		         
		        resultSet.close();
		        statement.close();
		        con.close();
		       
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** UserDL:getUsersApprovalList "+e.getMessage());
		}
		
	return users;
	}
	
	

}
