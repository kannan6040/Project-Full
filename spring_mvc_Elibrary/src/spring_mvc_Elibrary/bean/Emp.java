package spring_mvc_Elibrary.bean;
import javax.validation.constraints.Size;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;



public class Emp {    
private int id;  
@Size(min=5,message="required")
private String name; 
@NotNull @Min(1800) @Max(2020)
private float salary;    
private String designation;    
    
public int getId() 
{    
    return id;    
}    
public void setId(int id) {    
    this.id = id;    
}    
public String getName() {    
    return name;    
}    
public void setName(String name) {    
    this.name = name;    
}    
public float getSalary() {    
    return salary;    
}    
public void setSalary(float salary) {    
    this.salary = salary;    
}    
public String getDesignation() {    
    return designation;    
}    
public void setDesignation(String designation) {    
    this.designation = designation;    
}    
    
}    