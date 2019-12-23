package com.concept.book.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.concept.book.bean.Book;

public class BookDao 
{
JdbcTemplate template;    
    
	public void setTemplate(JdbcTemplate template) {    
	    this.template = template;    
	}    
	public int save(Book p){    
	    String sql="insert into tbrequestbook(bookname,authorname,publishedyear) values('"+p.getBookname()+"','"+p.getAuthorname()+"','"+p.getPublishedyear()+"')";    
	    return template.update(sql);    
	}    
	public int update(Book p){    
	    String sql="update tbrequestbook set bookname='"+p.getBookname()+"', authorname='"+p.getAuthorname()+"',publishedyear='"+p.getPublishedyear()+"' where requestid="+p.getRequestid()+"";    
	    return template.update(sql);    
	}    
	public int delete(int id){    
	    String sql="delete from tbrequestbook where requestid="+id+"";    
	    return template.update(sql);    
	}    
	public Book getBookById(int id){    
	    String sql="select * from tbrequestbook where requestid=?";    
	    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Book>(Book.class));    
	}    
	public List<Book> getBooks(){    
	    return template.query("select * from tbrequestbook",new RowMapper<Book>(){    
	        public Book mapRow(ResultSet rs, int row) throws SQLException {    
	        	Book e=new Book();    
	            e.setRequestid(rs.getInt(1));    
	            e.setBookname(rs.getString(2));    
	            e.setAuthorname(rs.getString(3));    
	            e.setPublishedyear(rs.getInt(4));    
	            return e;    
	        }    
	    });    
	}    

}
