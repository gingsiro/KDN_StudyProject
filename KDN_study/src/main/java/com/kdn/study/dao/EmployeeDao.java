package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.Employee;
import com.kdn.study.domain.PageBean;

public interface EmployeeDao {
	public Employee search(int empno);
	public List<Employee> searchAll(PageBean bean);
	public int getCount(PageBean bean);
	public void add(Employee employee);
	/** withdraw를 Y로 update해야 한다.*/
	public void update(int empno);
	public void update(Employee employee);
}
