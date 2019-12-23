package com.bl;

import java.sql.*;

import java.util.ArrayList;

import com.dl.*;
import com.dto.*;

public class BookBl 
{
	public static int addBook(Book book)
	{
		int result=0;
			
		try
		{
			
			
			
			 result = BookDl.addBook(book);
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** BookBL:addBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static Book getBook(int bookId)
	{
		int result=0;
		Book book=null;
		
		try
		{
			book=new Book();
			book=BookDl.getBook(bookId);
	        
		}		
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookBL:getBook "+e.getMessage());
		}
		return book;	
	
	}
	
	public static int currentBook()
	{
		
		int bookId=0;
		
		
		try
		{
			bookId=BookDl.currentBook();
		}
		catch(Exception e)
		{
			
			System.out.println("**Error** BookBL:currentBook "+e.getMessage());
		}
		return bookId;	
	
	}
	
	public static int modifyBook(Book book)
	{
		int result=0;
		
		try
		{
			result=BookDl.modifyBook(book);
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookBL:modifyBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static int deleteBook(int bookId)
	{
		int result=0;
		
		try
		{
			result=BookDl.deleteBook(bookId);
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookBL:deleteBook "+e.getMessage());
		}
		
	return result;
	}
	

	public static ArrayList<Book> getBooks()
	{
		
		
		ArrayList<Book> books=null;
		
		try
		{
			books = new ArrayList<Book>();
			
	        
			 books=BookDl.getBooks();
		}
		catch(Exception e)
		{
			
			System.out.println("**Error** BookBL:getBooks "+e.getMessage());
		}
		return books;	
	
	}
	
	public static ArrayList<Book> searchBooks(String searchField,String searchParameter)
	{
		
		
		ArrayList<Book> books=null;
		
		try
		{
			books = new ArrayList<Book>();
			books=BookDl.searchBooks(searchField, searchParameter);
			
			
		}
		catch(Exception e)
		{
			
			System.out.println("**Error** BookBL:searchBooks "+e.getMessage());
		}
		return books;	
	
	}
	
	public static int cleanBook()
	{
		int result=0;
		
		try
		{
			result=BookDl.cleanBook();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookBL:cleanBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static int views(int bookId)
	{
		int result=0;
		
		try
		{
			result=BookDl.views(bookId);
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** BookBL:cleanBook "+e.getMessage());
		}
		
	return result;
	}
	
	public static ArrayList<Book> getFavoriteBooks()
	{
		
		
		ArrayList<Book> books=null;
		
		try
		{
			books = new ArrayList<Book>();
			
	        
			 books=BookDl.getFavoriteBooks();
		}
		catch(Exception e)
		{
			
			System.out.println("**Error** BookBL:getFavoriteBooks "+e.getMessage());
		}
		return books;	
	
	}
	
}
