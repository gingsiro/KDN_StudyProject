package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.Study;

public interface ScheduleService {
	public Schedule search(int no);
	public void update(Schedule schedule);
	public void remove(int no);
	public void insertSchedule(Schedule schedule);
	public List<Schedule> searchAll(PageBean bean);
	
	public List<Schedule> searchMySchedule(int no);
}
