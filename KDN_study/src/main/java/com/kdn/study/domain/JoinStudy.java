package com.kdn.study.domain;

public class JoinStudy 
{
	private int empno;
	private int sno;
	private String dept;
	private String ename;
	private String sname;
	private String sinfo;
	private char gender;
	private char admin;
	private int smax;
	private int scurr;
	private int smaster;
	private int jno;
	
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

	public JoinStudy(int empno, int sno, String dept, String ename, String sname, String sinfo, char gender
										, char admin, int jno, int smax, int scurr, int smaster) 
	{
		this.empno = empno;
		this.sno = sno;
		this.dept = dept;
		this.ename = ename;
		this.gender = gender;
		this.admin = admin;
		this.smax = smax;
		this.scurr = scurr;
		this.smaster = smaster;
		this.jno = jno;
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

	public int getSmax() {
		return smax;
	}

	public void setSmax(int smax) {
		this.smax = smax;
	}

	public int getScurr() {
		return scurr;
	}

	public void setScurr(int scurr) {
		this.scurr = scurr;
	}

	public int getSmaster() {
		return smaster;
	}

	public void setSmaster(int smaster) {
		this.smaster = smaster;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSinfo() {
		return sinfo;
	}

	public void setSinfo(String sinfo) {
		this.sinfo = sinfo;
	}

	public int getJno() {
		return jno;
	}

	public void setJno(int jno) {
		this.jno = jno;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JoinStudy [empno=").append(empno).append(", sno=")
				.append(sno).append(", dept=").append(dept).append(", ename=")
				.append(ename).append(", sname=").append(sname)
				.append(", sinfo=").append(sinfo).append(", gender=")
				.append(gender).append(", admin=").append(admin)
				.append(", smax=").append(smax).append(", scurr=")
				.append(scurr).append(", smaster=").append(smaster)
				.append(", jno=").append(jno).append("]");
		return builder.toString();
	}
}
