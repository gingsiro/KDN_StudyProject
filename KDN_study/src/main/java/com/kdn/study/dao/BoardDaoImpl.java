package com.kdn.study.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("board.boardSearchAll", bean, rows);
	}
	
	public Board search(int bno) {
		return session.selectOne("board.search", bno);
	}

	public void update(Board board) {
		session.update("board.update", board);
		
	}
	
	public void delete(int bno) {
		session.delete("board.delete", bno);
		
	}
	
	public int maxSbnoSearch(int sno) {
		return session.selectOne("board.maxSbnoSearch", sno);
		
	}
	
	public void insert(Board board) {
		session.insert("board.insert", board);
		
	}
}
