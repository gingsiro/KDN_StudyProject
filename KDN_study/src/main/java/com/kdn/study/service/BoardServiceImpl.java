package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.BoardDao;
import com.kdn.study.domain.Board;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.UpdateException;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	@Qualifier("boardDao")
	private BoardDao dao;
	
	public List<Board> boardSearchAll(PageBean bean) {
		System.out.println("boardService>>>>");
		try{
			List<Board> boardlist = dao.boardSearchAll(bean);
			System.out.println("boardService<<<<<");
			return boardlist;
		}catch(Exception e){
			e.printStackTrace();
			throw new UpdateException(e.getMessage());
		}
	}
	
	public Board search(int bno) {
		return dao.search(bno);
		
	}
	
	public void update(Board board) {
		dao.update(board);
		
	}
}
