package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.Board;
import com.kdn.study.domain.PageBean;

public interface BoardDao {

	public List<Board> boardSearchAll(PageBean bean);
	
}
