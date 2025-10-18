package com.saurabh.ems.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.saurabh.ems.entity.Employee;
import com.saurabh.ems.services.EmployeeService;

@RestController
@RequestMapping("/api/employees")
@CrossOrigin(origins = "*") // allows API calls from frontend (optional)
public class EmployeeRestController {

	@Autowired
	private EmployeeService employeeService;

	// Get all employees
	@GetMapping
	public List<Employee> getAllEmployees() {
		return employeeService.getAllEmployee();
	}

	// Get employee by ID
	@GetMapping("/{id}")
	public Employee getEmployeeById(@PathVariable int id) {
		return employeeService.updateEmployee(id); // same as your getById logic
	}

	// Add new employee
	@PostMapping
	public Employee addEmployee(@RequestBody Employee employee) {
		employeeService.saveEmployee(employee);
		return employee;
	}

	// Update employee
	@PutMapping("/{id}")
	public Employee updateEmployee(@PathVariable int id, @RequestBody Employee updatedEmployee) {
		Employee existingEmployee = employeeService.updateEmployee(id);
		existingEmployee.setFirstName(updatedEmployee.getFirstName());
		existingEmployee.setLastName(updatedEmployee.getLastName());
		existingEmployee.setEmail(updatedEmployee.getEmail());
		employeeService.saveEmployee(existingEmployee);
		return existingEmployee;
	}

	// Delete employee
	@DeleteMapping("/{id}")
	public String deleteEmployee(@PathVariable int id) {
		employeeService.deleteEmployee(id);
		return "Employee deleted with id: " + id;
	}
}
