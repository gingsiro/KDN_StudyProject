package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;

public interface ScheduleDao {

	public Schedule search(int no);
	public void 			insertSchedule(Schedule schedule);
	public void 			updateSchedule(Schedule schedule);
	public void 			deleteSchedule(int scno);
	public List<Schedule> 	searchAllForCalendar(PageBean bean);
	public List<Schedule> 	searchAllForRightList(PageBean bean);
	public int 				getCount(PageBean bean);
	public int 				getBoardNo();
	
	public List<Schedule> searchMySchedule(int empno);
}
