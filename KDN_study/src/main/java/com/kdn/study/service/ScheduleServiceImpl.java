package com.kdn.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.ScheduleDao;
import com.kdn.study.domain.Schedule;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	@Qualifier("scheduleDao")
	private ScheduleDao dao;
	
	public Schedule search(int no) {
		return dao.search(no);
	}

}
