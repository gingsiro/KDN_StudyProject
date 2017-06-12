package com.kdn.study.domain;

import java.io.Serializable;
public class PageBean implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * key : 검색 조건
	 * word: 검색 단어
	 * pagelink : 목록의 페이지 링크를 표시
	 */
	private String key, word, pagelink;
	private int pageNo, interval = 5, start=1 , end=interval, sno ;
	
	public PageBean(){
		setKey("all");
		setWord("");
		setPagelink("1");
		setPageNo(1);
	}
	
	public PageBean(String key, String word) {
		super();
		this.key = key;
		this.word = word;
	}
	
	public PageBean(String key, String word, String pagelink, int pageNo) {
		setKey(key);
		setWord(word);
		setPagelink(pagelink);
		setPageNo(pageNo);
	}
	
	public PageBean(String key, String word, String pagelink, String pageNo) {
		setKey(key);
		setWord(word);
		setPagelink(pagelink);
		setPageNo(pageNo);
	}

	public PageBean(String key, String word, String pagelink, int pageNo,
			int interval, int start, int end, int sno) {
		super();
		this.key = key;
		this.word = word;
		this.pagelink = pagelink;
		this.pageNo = pageNo;
		this.interval = interval;
		this.start = start;
		this.end = end;
		this.sno = sno;
	}

	
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		if(key==null) this.key="all";
		else this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		if(word==null) this.word = "";
		else this.word = word;
	}
	public String getPagelink() {
		return pagelink;
	}
	public void setPagelink(String pagelink) {
		this.pagelink = pagelink;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		if(pageNo>0)this.pageNo = pageNo;
		else this.pageNo=1;
	}
	public void setPageNo(String pageNo) {
		try {
			this.pageNo = Integer.parseInt(pageNo);
		} catch (Exception e) {
			this.pageNo = 1;
		}
	}
	public String getKey(String k){
		if(k!=null && key.equals(k)) return "selected='selected'";
		else return "";
	}
	
	public int getInterval() {
		return interval;
	}
	public void setInterval(int interval) {
		this.interval = interval;
	}
	public int getStart() {
		if(pageNo>1){
			return start =  (pageNo -1) * interval + 1;
		}else{
			return   1;
		}
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
			return start+interval - 1;
	}
	public void setEnd(int end) {
		this.end =end;
	}

	@Override
	public String toString() {
		return "PageBean [key=" + key + ", word=" + word + ", pagelink="
				+ pagelink + ", pageNo=" + pageNo + ", interval=" + interval
				+ ", start=" + start + ", end=" + end + ", sno=" + sno + "]";
	}

	
}











