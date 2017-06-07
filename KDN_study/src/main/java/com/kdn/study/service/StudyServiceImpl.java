package com.kdn.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.StudyDao;
import com.kdn.study.domain.Study;

@Service("studyService")
public class StudyServiceImpl implements StudyService {
	@Autowired
	@Qualifier("studyDao")
	private StudyDao dao;
	
	public Study search(int no) {
		return dao.search(no);
	}

}
