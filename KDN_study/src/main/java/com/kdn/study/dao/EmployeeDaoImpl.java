package com.kdn.study.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.Employee;
import com.kdn.study.domain.PageBean;

@Repository("employeeDao")
public class EmployeeDaoImpl implements EmployeeDao
{
	@Autowired
	private SqlSessionTemplate session;

	public Employee search(int empno) {
		System.out.println(empno);
		System.out.println(session.selectOne("employee.search", empno));
		return session.selectOne("employee.search", empno);
	}

	public List<Employee> searchAll(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("employee.searchAll", bean, rows);
	}

	public int getCount(PageBean bean) {
		return session.selectOne("employee.getCount", bean);
	}

	public void add(Employee employee) {
		session.insert("employee.insert", employee);
	}

	public void update(int empno) {
		session.update("employee.delete", empno);
	}

	public void update(Employee employee) {
		System.out.println("댐"+employee);
		session.update("employee.update", employee);
	}

	
	
}
