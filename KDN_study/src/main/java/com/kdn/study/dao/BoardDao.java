package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.Board;
import com.kdn.study.domain.PageBean;

public interface BoardDao {

	public List<Board> boardSearchAll(PageBean bean);
	public Board search(int bno);
	public void update(Board board);
	public void delete(int bno);
	public int maxSbnoSearch(int sno);
	public void insert(Board board);
	
}
