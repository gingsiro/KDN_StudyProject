package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.EmployeeDao;
import com.kdn.study.domain.Employee;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.UpdateException;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService 
{
	@Autowired
	@Qualifier("employeeDao")
	private EmployeeDao dao;
	
	public Employee search(int empno)
	{
		Employee employee = null;
		
		try {
			employee = dao.search(empno);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
		if(employee == null){
			throw new UpdateException("아이디에 해당하는 회원을 찾을 수 없습니다.");
		}else{
			return employee;
		}
		
	}

	public List<Employee> searchAll(PageBean bean) {
		try {
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}

	public boolean login(int empno, String password) {
		Employee employee = null;
		
		try {
			employee = dao.search(empno);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
		if(employee == null){
			throw new UpdateException("해당하는 아이디는 존재하지 않습니다.");
		}
		if(password ==null || !password.equals(employee.getPassword())){
			throw new UpdateException("비밀번호가 맞지 않습니다.");
		}
		return true;
	}

	public void withdraw(int empno) {
	}

	public void update(Employee employee) {
	}

	public void add(Employee employee) {
	}

}
