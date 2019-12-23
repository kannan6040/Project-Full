<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  <style>
  .error{color:red;}
  </style>
        <h1>Add New Employee</h1>  
       <form:form method="post" action="save" modelAttribute="emp">    
        <table >    
         <tr>    
          <td>Name : </td>   
          <td><form:input path="name"  /></td> 
          <td> <form:errors path="name" cssClass="error"/>
</td><br><br>  
           
         </tr>    
         <tr>    
          <td>Salary :</td>    
          <td><form:input path="salary" /></td>  
         </tr>   
         <tr>    
          <td>Designation :</td>    
          <td><form:input path="designation" /></td>  
         </tr>   
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Save" /></td>    
         </tr>    
        </table>    
       </form:form>   