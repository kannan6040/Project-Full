package com.dl;

import com.dto.*;
import java.sql.*;
import java.util.ArrayList;



public class BookDl
{
	public static int addBook(Book book)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "INSERT INTO tbbook (title,genre,author,language,description,publisher,publishedyear,booktype,bookcontent,views) VALUES (?,?,?,?,?,?,?,?,EMPTY_BLOB(),0)";
			
			ps=con.prepareStatement(query);
			ps.setString(1, book.getTitle());
			ps.setString(2, book.getGenre());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getLanguage());
			ps.setString(5, book.getDescription());
			ps.setString(6, book.getPublisher());
			ps.setInt(7, book.getPublishedYear());
			ps.setString(8, book.getBookType());
			
			
			
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:addBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static Book getBook(int bookId)
	{
		int result=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		Book book=null;
		try
		{
			con=DBHelper.getConnection();
			query = "select author,title,booktype,description,genre,language,publishedyear,publisher from tbbook where bookid="+bookId;
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        if(resultSet.next()) 
	        {
	        	 book = new Book();
	        	 book.setBookId(bookId);
	        	 book.setAuthor(resultSet.getString("AUTHOR")); 
	        	 book.setTitle(resultSet.getString("TITLE"));
	        	 book.setBookType(resultSet.getString("BOOKTYPE")); 
	        	 book.setDescription(resultSet.getString("DESCRIPTION")); 
	        	 book.setGenre(resultSet.getString("GENRE"));
	        	 book.setLanguage(resultSet.getString("LANGUAGE"));
	        	 book.setPublishedYear(resultSet.getInt("PUBLISHEDYEAR"));
	        	 book.setPublisher(resultSet.getString("PUBLISHER"));
	        	 
			        
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:getBook "+e.getMessage());
		}
		return book;	
	
	}
	
	public static int currentBook()
	{
		
		int bookId=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "select max(bookid) from tbbook";
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        if(resultSet.next()) 
	        {
	        	
	        	bookId=resultSet.getInt(1); 
			        
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			
			System.out.println("**Error** BookDL:currentBook "+e.getMessage());
		}
		return bookId;	
	
	}
	
	public static int modifyBook(Book book)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "UPDATE tbbook SET TITLE=?,GENRE=?,AUTHOR=?,LANGUAGE=?,DESCRIPTION=?,PUBLISHER=?,PUBLISHEDYEAR=?,BOOKTYPE=? WHERE BOOKID=?";
			ps=con.prepareStatement(query);
			
			ps.setString(1, book.getTitle());
			ps.setString(2, book.getGenre());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getLanguage());
			ps.setString(5, book.getDescription());
			ps.setString(6, book.getPublisher());
			ps.setInt(7, book.getPublishedYear());
			ps.setString(8, book.getBookType());
			ps.setInt(9, book.getBookId());
			
			
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:modifyBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static int deleteBook(int bookId)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "delete from tbbook where bookid=?";
			
			ps=con.prepareStatement(query);
			ps.setInt(1, bookId);
		
					
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:deleteBook "+e.getMessage());
		}
		
	return result;
	}

	public static ArrayList<Book> getBooks()
	{
		int result=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		ArrayList<Book> books=null;
		Book book=null;
		try
		{
			books = new ArrayList<Book>();
			con=DBHelper.getConnection();
			query = "select bookid,author,title,booktype,description,genre,language,publishedyear,publisher from tbbook";
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        while(resultSet.next()) 
	        {
	        	 book = new Book();
	        	 book.setBookId(resultSet.getInt("BOOKID"));
	        	 book.setAuthor(resultSet.getString("AUTHOR")); 
	        	 book.setTitle(resultSet.getString("TITLE"));
	        	 book.setBookType(resultSet.getString("BOOKTYPE")); 
	        	 book.setDescription(resultSet.getString("DESCRIPTION")); 
	        	 book.setGenre(resultSet.getString("GENRE"));
	        	 book.setLanguage(resultSet.getString("LANGUAGE"));
	        	 book.setPublishedYear(resultSet.getInt("PUBLISHEDYEAR"));
	        	 book.setPublisher(resultSet.getString("PUBLISHER"));
	        	 books.add(book);
	        	 
			        
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:getBooks "+e.getMessage());
		}
		return books;	
	
	}
	
	public static ArrayList<Book> searchBooks(String searchField,String searchParameter)
	{
		int result=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		ArrayList<Book> books=null;
		Book book=null;
		String searchParameterLower=searchParameter.toLowerCase();
		try
		{
			books = new ArrayList<Book>();
			con=DBHelper.getConnection();
			//System.out.println(searchParameterLower);
			query = "select bookid,author,title,booktype,description,genre,language,publishedyear,publisher from tbbook where lower("+searchField+") LIKE '%"+searchParameterLower+"%'";
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        while(resultSet.next()) 
	        {
	        	 book = new Book();
	        	 book.setBookId(resultSet.getInt("BOOKID"));
	        	 book.setAuthor(resultSet.getString("AUTHOR")); 
	        	 book.setTitle(resultSet.getString("TITLE"));
	        	 book.setBookType(resultSet.getString("BOOKTYPE")); 
	        	 book.setDescription(resultSet.getString("DESCRIPTION")); 
	        	 book.setGenre(resultSet.getString("GENRE"));
	        	 book.setLanguage(resultSet.getString("LANGUAGE"));
	        	 book.setPublishedYear(resultSet.getInt("PUBLISHEDYEAR"));
	        	 book.setPublisher(resultSet.getString("PUBLISHER"));
	        	 books.add(book);
	        	 
			        
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:searchBooks "+e.getMessage());
		}
		return books;	
	
	}
	
	public static int cleanBook()
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			con=DBHelper.getConnection();
			query = "DELETE FROM tbbook WHERE dbms_lob.getlength(bookcontent)=0";
			
			ps=con.prepareStatement(query);
			
		
					
			 result = ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:cleanBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static int views(int bookId)
	{
		
		int result=0;
		String query;
		String newquery;
		PreparedStatement ps=null;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		int view=0;
		
		try
		{
			con=DBHelper.getConnection();
			query = "select views from tbbook where bookid="+bookId;
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        if(resultSet.next()) 
	        {
	        	
	        	
	        	view=resultSet.getInt(1);
	        	
			        
	         }
	        view++;
	        
	        
	        newquery = "UPDATE tbbook SET views=? WHERE BOOKID=?";
			ps=con.prepareStatement(newquery);
			
			ps.setInt(1, view);
			ps.setInt(2, bookId);
			
			
			 result = ps.executeUpdate();
	        
			 	ps.close();
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			
			System.out.println("**Error** BookDL:views "+e.getMessage());
		}
		return result;	
	
	}
	
	
	public static ArrayList<Book> getFavoriteBooks()
	{
		int result=0;
		String query;
		ResultSet resultSet=null;
		Statement statement=null;
		Connection con;
		ArrayList<Book> books=null;
		Book book=null;
		try
		{
			books = new ArrayList<Book>();
			con=DBHelper.getConnection();
			query = "select bookid,author,title,booktype,description,genre,language,publishedyear,publisher,views from tbbook order by views desc";
			statement = con.createStatement();
	        resultSet = statement.executeQuery(query);
	        while(resultSet.next()) 
	        {
	        	 book = new Book();
	        	 book.setBookId(resultSet.getInt("BOOKID"));
	        	 book.setAuthor(resultSet.getString("AUTHOR")); 
	        	 book.setTitle(resultSet.getString("TITLE"));
	        	 book.setBookType(resultSet.getString("BOOKTYPE")); 
	        	 book.setDescription(resultSet.getString("DESCRIPTION")); 
	        	 book.setGenre(resultSet.getString("GENRE"));
	        	 book.setLanguage(resultSet.getString("LANGUAGE"));
	        	 book.setPublishedYear(resultSet.getInt("PUBLISHEDYEAR"));
	        	 book.setPublisher(resultSet.getString("PUBLISHER"));
	        	 book.setView(resultSet.getInt("views"));
	        	 
	        	 books.add(book);
	        	 
			        
	         }
	        
			 
			    statement.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookDL:getFavoriteBooks "+e.getMessage());
		}
		return books;	
	
	}
	
	

}
