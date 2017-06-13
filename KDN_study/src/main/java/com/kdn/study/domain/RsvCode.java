package com.kdn.study.domain;

public class RsvCode {
	int rsvcode;
	int starttime;
	int endtime;
	
	public RsvCode() {}

	
	public RsvCode(int rsvcode, int starttime, int endtime) {
		super();
		this.rsvcode = rsvcode;
		this.starttime = starttime;
		this.endtime = endtime;
	}

	public int getRsvcode() {
		return rsvcode;
	}

	public void setRsvcode(int rsvcode) {
		this.rsvcode = rsvcode;
	}

	public int getStarttime() {
		return starttime;
	}

	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}

	public int getEndtime() {
		return endtime;
	}

	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}

	@Override
	public String toString() {
		return "RsvCode [rsvcode=" + rsvcode + ", starttime=" + starttime
				+ ", endtime=" + endtime + "]";
	}
	
	

}
