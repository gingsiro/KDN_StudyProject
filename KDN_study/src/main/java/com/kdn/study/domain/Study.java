package com.kdn.study.domain;

import java.io.Serializable;

public class Study implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int sno;
	private int smaster;
	private String sname;
	private int smax;
	private int scurr;
	private int cno;
	
	public Study(){ }
	
	public Study(int sno, int smaster, String sname, int smax, int scurr,
			int cno) {
		super();
		this.sno = sno;
		this.smaster = smaster;
		this.sname = sname;
		this.smax = smax;
		this.scurr = scurr;
		this.cno = cno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
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

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String toString() {
		return "Study [sno=" + sno + ", smaster=" + smaster + ", sname="
				+ sname + ", smax=" + smax + ", scurr=" + scurr + ", cno="
				+ cno + "]";
	}
	
}
