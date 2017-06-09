package com.kdn.study.domain;

import java.io.Serializable;

public class Schedule implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int scno;
	private String sctitle;
	private String scdate;
	private int sno;
	private String sname;
		
	public Schedule() { }
	
	public Schedule(int scno, String sctitle, String scdate, int sno) {
		this.scno = scno;
		this.sctitle = sctitle;
		this.scdate = scdate;
		this.sno = sno;
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public String getSctitle() {
		return sctitle;
	}
	public void setSctitle(String sctitle) {
		this.sctitle = sctitle;
	}
	public String getScdate() {
		return scdate;
	}
	public void setScdate(String scdate) {
		this.scdate = scdate;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Schedule [scno=").append(scno).append(", sctitle=")
				.append(sctitle).append(", scdate=").append(scdate)
				.append(", sno=").append(sno).append("]");
		return builder.toString();
	}
}
