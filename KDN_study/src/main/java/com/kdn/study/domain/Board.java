package com.kdn.study.domain;

public class Board {

	int bno;
	int sbno;
	String btitle;
	String bcontents;
	String regdate;
	int empno;
	int sno;
	
	public Board() {}

	
	public Board(int bno, int sbno, String btitle, String bcontents,
			String regdate, int empno, int sno) {
		super();
		this.bno = bno;
		this.sbno = sbno;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.regdate = regdate;
		this.empno = empno;
		this.sno = sno;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getSbno() {
		return sbno;
	}


	public void setSbno(int sbno) {
		this.sbno = sbno;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontents() {
		return bcontents;
	}


	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
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


	@Override
	public String toString() {
		return "Board [bno=" + bno + ", sbno=" + sbno + ", btitle=" + btitle
				+ ", bcontents=" + bcontents + ", regdate=" + regdate
				+ ", empno=" + empno + ", sno=" + sno + "]";
	}
	
	

}
