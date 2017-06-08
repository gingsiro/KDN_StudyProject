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
	public void update(Schedule schedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void add(Schedule schedule, String dir) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public List<Schedule> searchAll(PageBean bean) {
		try {
			System.out.println(">>>>>>>>>>>>1");
			int total = dao.getCount(bean);
			System.out.println(">>>>>>>>>>>>2");
			PageUtility bar = new PageUtility(bean.getInterval()
														  		, total
														  		, bean.getPageNo());
			bean.setPagelink(bar.getPageBar());
			
			System.out.println(">>>>>>>>>>>>3");
			return dao.searchAll(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}
}
