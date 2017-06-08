package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;

public interface ScheduleService {
	public Schedule search(int no);
	public void update(Schedule schedule);
	public void remove(int no);
	public void add(Schedule schedule, String dir);
	public List<Schedule> searchAll(PageBean bean);
}
