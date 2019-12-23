package spring_mvc_Elibrary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import spring_mvc_Elibrary.dao.*;
import spring_mvc_Elibrary.bean.*;
 
@Service
public class EmployeeServImpl {
 
    @Autowired
    EmployeeDaoImpl empdao;
 
//    public List<Employee> getAllEmployees() {
//        return empdao.getAllEmployeesFromDb();
//    }
    
    public static int addEmployee(Employee employee) {
    	System.out.print("in Serv");
        return EmployeeDaoImpl.addEmployee(employee);
        
        
    }
    
    
    public static List<Employee> getEmployees() {
        return EmployeeDaoImpl.getEmployees();
    }
    
    public static Employee getEmployee(int emplouee_id) {
        return EmployeeDaoImpl.getEmployee(emplouee_id);
    }
    
    public static int updateEmployee(Employee employee)
    {
        return EmployeeDaoImpl.updateEmployee(employee);
    }
    
    
    public static int deleteEmployee(int employee_id) {
        return EmployeeDaoImpl.deleteEmployee(employee_id);
    }
}