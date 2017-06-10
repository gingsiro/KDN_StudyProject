package com.kdn.study.domain;

public class JoinStudy {
	private int empno;
	private int sno;
	
	public JoinStudy(){ }
	
	public JoinStudy(int empno, int sno) {
		this.empno = empno;
		this.sno = sno;
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

	public String toString() {
		return "JoinStudy [empno=" + empno + ", sno=" + sno + "]";
	}
	
}
