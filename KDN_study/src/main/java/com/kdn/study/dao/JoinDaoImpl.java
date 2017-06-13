package com.kdn.study.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.JoinStudy;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.Study;

@Repository("joinDao")
public class JoinDaoImpl implements JoinDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<JoinStudy> searchJoinMembers(int sno) {
		return session.selectList("joinstudy.selectJoinMembers", sno);
	}

	@Override
	public void deleteMember(int jno) {
		session.delete("joinstudy.deleteMember", jno);
	}

}
