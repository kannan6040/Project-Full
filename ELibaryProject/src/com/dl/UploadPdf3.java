package com.dl;

import com.dto.*;
import java.io.*;

import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;


@WebServlet(name="UploadPdf3", urlPatterns = ("/Book/UploadPdf3"))
@MultipartConfig(maxFileSize = 41943040)
public class UploadPdf3 extends HttpServlet
{
	PrintWriter out;
	@Override
	protected
	void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("bookid"));  
		//System.out.print(id);
		response.setContentType("text/html;charset=UTF-8");
		out=response.getWriter();
		int result=0;
		javax.servlet.http.Part part=request.getPart("pdf");
		if(part!=null)
		{
			try
			{
	        	Connection conn=DBHelper.getConnection(); 
	        	PreparedStatement ps=conn.prepareStatement("update tbbook set bookcontent=? where bookid=?");
	        	InputStream is=part.getInputStream();
	        	ps.setInt(2, id);
	        	ps.setBlob(1, is);
	        	result =ps.executeUpdate();
	        	if(result>0)
	        	{	
	        		request.setAttribute("message", "Book Uploaded Successfully");
	        		request.getRequestDispatcher("../Admin/adminhome.jsp").forward(request, response);
	        		//response.sendRedirect("../Book/adminviewallbooks.jsp");
	        		
	        		
	        	}
	        	else
	        	{
	        		
	        		response.sendRedirect("../Admin/adminhome.jsp");
	        		
	        	}

			}
			catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
	}

}
