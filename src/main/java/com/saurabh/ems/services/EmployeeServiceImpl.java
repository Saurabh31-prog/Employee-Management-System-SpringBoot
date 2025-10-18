package com.saurabh.ems.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saurabh.ems.Repository.EmployeeRepository;
import com.saurabh.ems.entity.Employee;
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeRepository employeeRepository;
	@Override
	public List<Employee> getAllEmployee() {
		
		return employeeRepository.findAll();
	}
	@Override
	public void saveEmployee(Employee employee) {
		employeeRepository.save(employee);
		
	}
	@Override
	public Employee updateEmployee(int id) {
		Optional<Employee>optional=employeeRepository.findById(id); 
		Employee employee=null;
		employee=optional.get();
		return employee;
	}
	@Override
	public void deleteEmployee(int id) {
		this.employeeRepository.deleteById(id);
		
	}
	

}
