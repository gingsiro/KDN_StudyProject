package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.JoinStudy;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Study;

public interface StudyDao {
	public Study search(int sno);
	public List<Study> searchAll(PageBean bean);
	public List<Study> searchMyStudy(int empno);
	public void createStudy(Study study);
	public void updateStudy(Study study);
	public void joinStudy(JoinStudy joinInfo);
	public void dismissStudy(JoinStudy joinInfo);
	public void deleteStudy(int sno);
}
