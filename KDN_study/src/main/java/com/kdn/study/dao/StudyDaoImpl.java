package com.kdn.study.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.JoinStudy;
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
	
	public List<Study> searchMyStudy(int empno){
		return session.selectList("study.searchMyStudy", empno);
	}

	public void createStudy(Study study) {
		session.insert("study.createStudy", study);
	}

	public void updateStudy(Study study) {
		session.update("study.updateStudy", study);
	}
	
	public void joinStudy(int empno, int sno){
		Study study = session.selectOne("study.search", sno);
		study.setScurr(study.getScurr()+1);
		session.update("study.updateStudy", study);
		
		JoinStudy join = new JoinStudy(empno, sno);
		session.insert("study.joinStudy", join);
	}
	
}
