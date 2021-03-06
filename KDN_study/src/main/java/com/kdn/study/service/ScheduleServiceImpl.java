package com.kdn.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.ScheduleDao;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.UpdateException;
import com.kdn.study.util.PageUtility;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	@Qualifier("scheduleDao")
	private ScheduleDao dao;
	
	public Schedule search(int no) {
		return dao.search(no);
	}

	@Override
	public void updateSchedule(Schedule schedule) {
		System.out.println("service>>>>>>>>>>>>>" + schedule);
		dao.updateSchedule(schedule);
	}

	@Override
	public void deleteSchedule(int scno) {
		System.out.println("service>>>>>>>>" + scno);
		dao.deleteSchedule(scno);
	}

	@Override
	public void insertSchedule(Schedule schedule) {
		System.out.println("service>>>>>" + schedule);
		dao.insertSchedule(schedule);		
	}

	
	@Override
	public List<Schedule> searchAllForCalendar(PageBean bean) {
		try {
			int total = dao.getCount(bean);
			PageUtility bar = new PageUtility(bean.getInterval(), total, bean.getPageNo());
			
			bean.setPagelink(bar.getPageBar());
			return dao.searchAllForCalendar(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
	
	@Override
	public List<Schedule> searchAllForRightList(PageBean bean) {
		try {
			int total = dao.getCount(bean);
			PageUtility bar = new PageUtility(bean.getInterval(), total, bean.getPageNo());
			
			bean.setPagelink(bar.getPageBar());
			return dao.searchAllForRightList(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}

	@Override
	public List<Schedule> searchMySchedule(int empno) {
		return dao.searchMySchedule(empno);
	}
}
