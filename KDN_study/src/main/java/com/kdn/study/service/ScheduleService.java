package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.Study;

public interface ScheduleService {
	public Schedule search(int no);
	public void updateSchedule(Schedule schedule);
	public void deleteSchedule(int scno);
	public void insertSchedule(Schedule schedule);
	public List<Schedule> searchAllForCalendar(PageBean bean);
	public List<Schedule> searchAllForRightList(PageBean bean);
	
	public List<Schedule> searchMySchedule(int empno);
}
