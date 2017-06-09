package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.domain.Employee;
import com.kdn.study.dao.EmployeeDao;
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

	/*public void withdraw(int empno) {
		
	}*/

	public void update(Employee employee) {
		try {

			Employee find = dao.search(employee.getEmpno());
			System.out.println(find);
			if(find == null){
				throw new UpdateException("아이디에 해당하는 회원이 없어 수정할 수 없습니다.");
			}else{
				dao.update(employee);
			}
		} catch(Exception  s){
			throw new UpdateException("업데이트DB 서버 오류");
		}
	}

	public void add(Employee employee) {
		/*try {*/
			Employee find= dao.search(employee.getEmpno());
			if(find != null){
				System.out.println(find);
				throw new UpdateException("이미 등록된 사원번호 입니다.");
			}
			if (find == null) {
				if(employee.getEmpno() == 0){
					throw new UpdateException("사원번호를 입력하세요");
				}
				else if(employee.getDept() == ""){
					throw new UpdateException("부서명을 입력하세요");
				}
				else if(employee.getEname() == ""){
					throw new UpdateException("이름을 입력하세요");
				}
				else if(employee.getGender() == ""){
					throw new UpdateException("성별을 입력하세요");
				}
				else if(employee.getPassword() == ""){
					throw new UpdateException("비밀번호를 입력하세요");
				}
				else{
					dao.add(employee);
				}
			}
	}
}
		
			
			
			
			
			
			
			/*else{
				System.out.println("add.search"+find);
				dao.add(employee);
			}*/
		
		/*} catch(Exception  s){
			System.out.println("add.errorcatch");
			throw new UpdateException("DB 서버 오류");
		}*/

