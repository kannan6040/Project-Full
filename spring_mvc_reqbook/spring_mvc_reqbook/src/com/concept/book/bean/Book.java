package com.concept.book.bean;
import javax.validation.constraints.Size; 
import javax.validation.constraints.Max;  
import javax.validation.constraints.Min; 


public class Book 
{
	
	private int requestid; 
	
	@Size(min=1,message="book name required") 
	private String bookname;
	
	@Size(min=1,message="author name required") 
	private String authorname; 
	
	@Min(value=1700, message="must be equal or greater than 1700")  
    @Max(value=2020, message="must be equal or less than 2020")  
	private int publishedyear;  

	
	public int getRequestid() {
		return requestid;
	}
	public void setRequestid(int requestid) {
		this.requestid = requestid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public int getPublishedyear() {
		return publishedyear;
	}
	public void setPublishedyear(int publishedyear) {
		this.publishedyear = publishedyear;
	}
	  

}
