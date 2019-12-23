package spring_mvc_Elibrary.controllers;


import java.util.List;

import spring_mvc_Elibrary.bean.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import spring_mvc_Elibrary.service.*;

 
@RestController
public class EmployeeController {
 
//    @Autowired
//    EmployeeServImpl userService;
// 
   
    
    @CrossOrigin(origins="http://localhost:4200") 
    @PostMapping("/employeeAdd")
	public Employee createEmployee(@RequestBody Employee employee) {
    	
    	System.out.println("Employee Name :" +employee.getFirstName());
    	
    	EmployeeServImpl.addEmployee(employee);
    	
    	
		//return employeeRepository.save(employee);
    	System.out.println("Employee Name :" +employee.getLastName());
    	
    	return employee;
	}

    @CrossOrigin(origins="http://localhost:4200") 
    @RequestMapping(value= "/getEmployees", method= RequestMethod.GET) 
    public List<Employee> getEmployees() {
    	return EmployeeServImpl.getEmployees();
    }
    
    @CrossOrigin(origins="http://localhost:4200")                           // @CrossOrigin is used to handle the request from a difference origin.
    @RequestMapping(value= "/getEmployee/{employeeid}", method= RequestMethod.GET) 
    public Employee  getEmployee(@PathVariable("employeeid") int id) {
    	System.out.println("add employeeid : "+id);
    	Employee emploeee=EmployeeServImpl.getEmployee(id);
    	
        return emploeee;
    }
    
    @CrossOrigin(origins="http://localhost:4200")                           // @CrossOrigin is used to handle the request from a difference origin.
    @RequestMapping(value= "/employeeDelete/{employeeid}", method= RequestMethod.GET) 
    public int  getDelete(@PathVariable("employeeid") int id) {
    	System.out.println("delete employeeid : "+id);
    	return EmployeeServImpl.deleteEmployee(id);
    
    }
    
    
    @CrossOrigin(origins="http://localhost:4200") 
    @PostMapping("/employeeUpdate")
	public Employee updateEmployee(@RequestBody Employee employee) {
    	
    	System.out.println("Employee Name :" +employee.getFirstName());
    	
    	EmployeeServImpl.updateEmployee(employee);
    	
    	
		//return employeeRepository.save(employee);
    	System.out.println("Employee Name :" +employee.getLastName());
    	
    	return employee;
	}
    
}
