package com.kdn.study.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.Board;
import com.kdn.study.domain.PageBean;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<Board> boardSearchAll(PageBean bean){
		System.out.println("boardDao>>>>");
		return session.selectList("board.boardSearchAll", bean);
	}
	
	

}
