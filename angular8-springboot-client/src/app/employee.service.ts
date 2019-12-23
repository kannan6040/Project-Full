import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  private baseUrl = 'http://localhost:8090/spring_mvc_Elibrary/';

  constructor(private http: HttpClient) { }

  getEmployee(id: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/getEmployee/${id}`);
  }

  createEmployee(employee: Object): Observable<Object> {
    return this.http.post(`${this.baseUrl}/employeeAdd`, employee);
  }

  updateEmployee(employee: Object): Observable<Object> {
    return this.http.post(`${this.baseUrl}/employeeUpdate`, employee);
  }

  deleteEmployee(id: number): Observable<any> {
   // return this.http.delete(`${this.baseUrl}/employeeDelete/${id}`, { responseType: 'text' });
   return this.http.get(`${this.baseUrl}/employeeDelete/${id}`);
  }

  getEmployeesList(): Observable<any> {
    return this.http.get(`${this.baseUrl}/getEmployees`);
  }
}
