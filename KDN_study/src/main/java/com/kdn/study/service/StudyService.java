package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Study;

public interface StudyService {
	public Study search(int no);
	public List<Study> searchAll(PageBean bean);
}
