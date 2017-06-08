package com.kdn.study.domain;

import java.io.Serializable;

public class Room implements Serializable {
	private int rno;
	private String rname;
	private int rmax;
	
	public Room() {}
	
	
	public Room(int rno, String rname, int rmax) {
		super();
		this.rno = rno;
		this.rname = rname;
		this.rmax = rmax;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public int getRmax() {
		return rmax;
	}

	public void setRmax(int rmax) {
		this.rmax = rmax;
	}
	
	
	
	
}
