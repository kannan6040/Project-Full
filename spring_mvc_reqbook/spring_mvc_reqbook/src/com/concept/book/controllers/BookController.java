package com.concept.book.controllers;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.concept.book.bean.Book;
import com.concept.book.dao.BookDao;
import com.concept.book.bean.Book;
@Controller  
public class BookController 
{

	
	    @Autowired    
	    BookDao dao;//will inject dao from XML file    
	        
	    /*It displays a form to input data, here "command" is a reserved request attribute  
	     *which is used to display object data into form  
	     */    
	    @RequestMapping("/bookform")    
	    public String showform(Model m){    
	        m.addAttribute("book", new Book());  
	        return "book/bookform";   
	    }    
	    /*It saves object into database. The @ModelAttribute puts request data  
	     *  into model object. You need to mention RequestMethod.POST method   
	     *  because default request is GET*/    
	    @RequestMapping(value="/save",method = RequestMethod.POST)    
	    public String save(@Valid @ModelAttribute("book") Book book,  BindingResult br)
	    {
	        

	        if(br.hasErrors())  
	        {  
	        	return "book/bookform"; 
	        
	            }
	        else
	        {
	         dao.save(book);
	        
	        
	        }
	            
	        return "redirect:/viewbook";//will redirect to viewbook request mapping    
	            }
	    /* It provides list of employees in model object */    
	    @RequestMapping("/viewbook")    
	    public String viewbook(Model m){    
	        List<Book> list=dao.getBooks();    
	        m.addAttribute("list",list);  
	        return "book/viewbook";    
	    }    
	    /* It displays object data into form for the given id.   
	     * The @PathVariable puts URL data into variable.*/    
	    @RequestMapping(value="/editbook/{id}")    
	    public String edit(@PathVariable int id, Model m){    
	    	Book book=dao.getBookById(id);    
	        m.addAttribute("book",book);  
	        return "book/bookeditform";    
	    }    
	    /* It updates model object. */    
	    @RequestMapping(value="/editsave",method = RequestMethod.POST)    
	    public String editsave(@Valid @ModelAttribute("book") Book book,  BindingResult br)
	    {
	        

	        if(br.hasErrors())  
	        {  
	        	return "book/bookform"; 
	        
	            }
	        else
	        {
	         dao.update(book);
	        
	        
	        }
	            
	        return "redirect:/viewbook";//will redirect to viewbook request mapping    
	            } 
	    /* It deletes record for the given id in URL and redirects to /viewbook */    
	    @RequestMapping(value="/deletebook/{id}",method = RequestMethod.GET)    
	    public String delete(@PathVariable int id){    
	        dao.delete(id);    
	        return "redirect:/viewbook";    
	    }     
}
