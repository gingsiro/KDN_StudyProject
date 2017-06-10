package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.Employee;
import com.kdn.study.domain.PageBean;

public interface EmployeeService {

	public Employee search(int empno);
	public List<Employee> searchAll(PageBean bean);
	public boolean login(int empno, String password);
	public void update(Employee employee);
	public void add(Employee employee);
	
	
	/*public Employee searchpassword(int empno, String password);*/
	public void delete(Employee employee);
	
	

}