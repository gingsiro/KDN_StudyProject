package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Study;

public interface StudyDao {
	public Study search(int no);
	public List<Study> searchAll(PageBean bean);
}
