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
	
	public Study search(int sno) {
		return session.selectOne("study.search", sno);
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
	
	public void joinStudy(JoinStudy joinInfo){
		session.insert("study.joinStudy", joinInfo);
		
		System.out.println("JoinStudy DAO");
		Study study = session.selectOne("study.search", joinInfo.getSno());
		study.setScurr(study.getScurr()+1);
		session.update("study.updateStudy", study);
	}
	
	public void dismissStudy(JoinStudy joinInfo){
		System.out.println("Dissmissstudy DAO1");
		session.delete("study.dismissStudy", joinInfo);

		System.out.println("탈퇴 신청 정보 :"+joinInfo);
		Study study = session.selectOne("study.search", joinInfo.getSno());
		System.out.println("탈퇴할스터디 :"+study);
		study.setScurr(study.getScurr()-1);
		session.update("study.updateStudy", study);
	}
	
}
