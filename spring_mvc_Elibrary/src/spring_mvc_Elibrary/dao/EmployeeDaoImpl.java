package spring_mvc_Elibrary.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import spring_mvc_Elibrary.bean.*;



@Repository
public class EmployeeDaoImpl {
 
    
    public static int addEmployee(Employee employee)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		try
		{
			//System.out.print("in addemp beginning");
			
			
			//INSERT INTO `employee_mvc`.`USER_TAB` (`ID`, `NAME`, `USERID`, `password`, `phone`) VALUES ('501', 'ahana', 'ahana sarva', '190', '897979')
			
			con=DBHelper.getConnection();
			query = "INSERT INTO EMPLOYEE (firstName,lastName,emailId) VALUES(?,?,?)";
			
			ps=con.prepareStatement(query);
			ps.setString(1, employee.getFirstName());
			ps.setString(2, employee.getLastName());
			ps.setString(3, employee.getEmailId());
			//ps.setBoolean(4, false);
			//System.out.print("in dao before");
			
			 result = ps.executeUpdate();
			 
			 query = "delete from TBFEEDBACK";
			 ps=con.prepareStatement(query);
			 ps.executeUpdate();
			 query = "INSERT INTO TBFEEDBACK( id, username,bookname,feedback ) SELECT id, firstname, lastname, emailid FROM employee";
			 ps=con.prepareStatement(query);
			 result=ps.executeUpdate();
			 
			 //System.out.print("in dao after"+result);
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			result=-1;
			System.out.println("**Error** CustomerDL:addCustomer "+e.getMessage());
		}
		
	return result;
	}
    
    
	public static ArrayList<Employee> getEmployees()
	{
		ArrayList<Employee> employees=null;
		Connection con=null;
		  Statement statement =null;
		  ResultSet resultSet=null;
		  Employee employee=null;
		try
		{
			employees = new ArrayList<Employee>();
		        String sql = "SELECT * FROM  employee ORDER BY id DESC";
		        con=DBHelper.getConnection();
		        statement = con.createStatement();
		        resultSet = statement.executeQuery(sql);
		        while (resultSet.next()) {
		        	employee = new Employee();
		        	employee.setId(resultSet.getInt("id"));
		        	employee.setFirstName(resultSet.getString("firstName"));
		        	employee.setLastName(resultSet.getString("lastName"));
		        	employee.setEmailId(resultSet.getString("emailId"));
		      
		          
		        	employees.add(employee);
		        }
		         
		        resultSet.close();
		        statement.close();
		        con.close();
		       
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** EmployeeDaoimpl:getEmployees "+e.getMessage());
		}
		
	return employees;
	}
	public static Employee getEmployee(int employee_id)
	{
		Connection con=null;
		Statement statement =null;
		ResultSet resultSet=null;
		Employee employee=null;
		
		try
		{
			
			
			String sql = "SELECT * FROM employee WHERE id="+employee_id+"";
	        con=DBHelper.getConnection();
	        statement = con.createStatement();
	        resultSet = statement.executeQuery(sql);
	         if(resultSet.next()) {
	        	 employee = new Employee();
		        	employee.setId(resultSet.getInt("id"));
		        	employee.setFirstName(resultSet.getString("firstName"));
		        	employee.setLastName(resultSet.getString("lastName"));
		        	employee.setEmailId(resultSet.getString("emailId"));
		      
	         }
	         
	         return employee;
		}
		catch(Exception e)
		{
			System.out.println("**Error** EmployeeDaoimpl:getEmployee "+e.getMessage());
		}
		
	return employee;
	}
	
	
	public static int updateEmployee(Employee employee)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "UPDATE employee SET firstName=?,lastName=?,emailId=? WHERE id=?";
			ps=con.prepareStatement(query);
		
			ps.setString(1, employee.getFirstName());
			ps.setString(2, employee.getLastName());
			ps.setString(3, employee.getEmailId());
			ps.setLong(4, employee.getId());
			
			
			 result = ps.executeUpdate();
			 
			 query = "delete from TBFEEDBACK";
			 ps=con.prepareStatement(query);
			 ps.executeUpdate();
			 query = "INSERT INTO TBFEEDBACK( id, username,bookname,feedback ) SELECT id, firstname, lastname, emailid FROM employee";
			 ps=con.prepareStatement(query);
			 result=ps.executeUpdate();
			 
			 ps.close();
			 con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** EmployeeDaoimpl:updateEmployee "+e.getMessage());
		}
		
	return result;
	}
	
	public static int deleteEmployee(int employee_id)
	{
		int result=0;
		String query;
		PreparedStatement ps=null;
		Connection con;
		
		try
		{
			con=DBHelper.getConnection();
			query = "delete from employee where id=?";
			ps=con.prepareStatement(query);
			ps.setLong(1, employee_id);
			 result = ps.executeUpdate();
			 query = "delete from TBFEEDBACK";
			 ps=con.prepareStatement(query);
			 ps.executeUpdate();
			 query = "INSERT INTO TBFEEDBACK( id, username,bookname,feedback ) SELECT id, firstname, lastname, emailid FROM employee";
			 ps=con.prepareStatement(query);
			 result=ps.executeUpdate();
			    ps.close();
		        con.close();
			
		}
		catch(Exception e)
		{
			System.out.println("**Error** EmployeeDaoimpl:deleteEmployee "+e.getMessage());
		}
		
	return result;
	}
	
    
}