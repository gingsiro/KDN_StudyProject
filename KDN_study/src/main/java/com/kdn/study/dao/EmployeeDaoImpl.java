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
		System.out.println("dao.search");
		System.out.println(empno);
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

	/*public void update(int empno) {
		session.update("employee.delete", empno);
	}*/

	public void update(Employee employee) {
		session.update("employee.update", employee);
	}

	
	
	
	/*public Employee searchpassword(int empno, String password) {
		System.out.println("dao.searchpassword");
		System.out.println("입력한 password" +password);
		return session.selectList("employee.searchpassword", empno, password);
	}*/
	
	public void delete(Employee employee) {
	session.delete("employee.delete", employee);
}

	/*public void update(int empno) {
		
	}*/


	
	
}
