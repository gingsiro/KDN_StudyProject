package com.kdn.study.domain;

import java.io.Serializable;

public class Employee implements Serializable{
	private static final long serialVersionUID = 1L;
	private int empno;
	private String dept;
	private String ename;
	private String gender;
	private String password;
	private String admin;
	
	public Employee() {	}

	public Employee(int empno, String dept, String ename, String gender,
			String password, String admin) {
		super();
		this.empno = empno;
		this.dept = dept;
		this.ename = ename;
		this.gender = gender;
		this.password = password;
		this.admin = admin;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Employee [empno=").append(empno).append(", dept=")
				.append(dept).append(", ename=").append(ename)
				.append(", gender=").append(gender).append(", password=")
				.append(password).append(", admin=").append(admin).append("]");
		return builder.toString();
	}

}
