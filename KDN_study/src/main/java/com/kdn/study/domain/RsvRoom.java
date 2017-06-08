package com.kdn.study.domain;

public class RsvRoom {
	private int  rsvno;
	private String rsvdate;
	private int rsvcode;
	private int rno;
	private int sno;
	private int empno;
	
	public RsvRoom() {}
	
	
	
	public RsvRoom(int rsvno, String rsvdate, int rsvcode, int rno, int sno,
			int empno) {
		super();
		this.rsvno = rsvno;
		this.rsvdate = rsvdate;
		this.rsvcode = rsvcode;
		this.rno = rno;
		this.sno = sno;
		this.empno = empno;
	}

	public int getRsvno() {
		return rsvno;
	}
	public void setRsvno(int rsvno) {
		this.rsvno = rsvno;
	}
	public String getRsvdate() {
		return rsvdate;
	}
	public void setRsvdate(String rsvdate) {
		this.rsvdate = rsvdate;
	}
	public int getRsvcode() {
		return rsvcode;
	}
	public void setRsvcode(int rsvcode) {
		this.rsvcode = rsvcode;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	

}
