package com.kdn.study.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Study;

@Repository("studyDao")
public class StudyDaoImpl implements StudyDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public Study search(int no) {
		return session.selectOne("study.search", no);
	}
	
	public List<Study> searchAll(PageBean bean){
		return session.selectList("study.searchAll", bean);
	}

	public void createStudy(Study study) {
		session.insert("study.createStudy", study);
	}
	
}
