package com.kdn.study.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.Study;

@Repository("studyDao")
public class StudyDaoImpl implements StudyDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public Study search(int no) {
		return session.selectOne("study.search", no);
	}

}
