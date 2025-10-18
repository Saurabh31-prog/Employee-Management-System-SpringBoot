package com.saurabh.ems.services;

import java.util.List;

import com.saurabh.ems.entity.Employee;

public interface EmployeeService {
	List<Employee>getAllEmployee();
	void saveEmployee(Employee employee);
	Employee updateEmployee(int id);
	void deleteEmployee(int id);
}
 