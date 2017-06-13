package com.kdn.study.domain;

public class JoinStudy 
{
	private int empno;
	private int sno;
	private String dept;
	private String ename;
	private char gender;
	private char admin;
	
	public JoinStudy(){ }
	
	public JoinStudy(int empno, int sno) {
		this.empno = empno;
		this.sno = sno;
	}
	
	public JoinStudy(int empno, int sno, String dept, String ename, char gender, char admin) 
	{
		this.empno = empno;
		this.sno = sno;
		this.dept = dept;
		this.ename = ename;
		this.gender = gender;
		this.admin = admin;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
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

	public char getAdmin() {
		return admin;
	}

	public void setAdmin(char admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JoinStudy [empno=").append(empno).append(", sno=")
				.append(sno).append(", dept=").append(dept).append(", ename=")
				.append(ename).append(", gender=").append(gender)
				.append(", admin=").append(admin).append("]");
		return builder.toString();
	}
}
