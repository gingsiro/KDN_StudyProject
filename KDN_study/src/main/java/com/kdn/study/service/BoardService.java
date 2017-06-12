package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.Board;
import com.kdn.study.domain.PageBean;

public interface BoardService {

	public List<Board> boardSearchAll(PageBean bean);
	
}
