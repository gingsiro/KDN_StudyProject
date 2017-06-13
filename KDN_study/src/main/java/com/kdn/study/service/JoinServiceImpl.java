package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.JoinDao;
import com.kdn.study.dao.ScheduleDao;
import com.kdn.study.domain.JoinStudy;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.UpdateException;
import com.kdn.study.util.PageUtility;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	@Autowired
	@Qualifier("joinDao")
	private JoinDao dao;
	
	@Override
	public List<JoinStudy> searchJoinMembers(int sno) {
		return dao.searchJoinMembers(sno);
	}
}
