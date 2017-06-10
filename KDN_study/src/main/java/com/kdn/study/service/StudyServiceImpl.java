package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.StudyDao;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Study;

@Service("studyService")
public class StudyServiceImpl implements StudyService {
	@Autowired
	@Qualifier("studyDao")
	private StudyDao dao;
	
	public Study search(int sno) {
		return dao.search(sno);
	}
	
	public List<Study> searchAll(PageBean bean){
		return dao.searchAll(bean);
	}
	
	public List<Study> searchMyStudy(int empno){
		return dao.searchMyStudy(empno);
	}
	
	public void createStudy(Study study) {
		dao.createStudy(study);
	}
	
	public void updateStudy(Study study) {
		dao.updateStudy(study);
	}
	
	public void joinStudy(int empno, int sno){
		dao.joinStudy(empno, sno);
	}
}
