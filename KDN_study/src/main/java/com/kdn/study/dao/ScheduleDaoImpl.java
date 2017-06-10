package com.kdn.study.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.Study;

@Repository("scheduleDao")
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public Schedule search(int no) {
		return session.selectOne("schedule.search", no);
	}

	@Override
	public void insertSchedule(Schedule schedule) {
		System.out.println("DAo>>>>>" + schedule);
		session.insert("schedule.insertSchedule", schedule);
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
	public List<Schedule> searchAll(PageBean bean) {
		/*
		 * RowBounds(offset, limit)
		 * offset 추출할 row의 시작 위치 (0부터 시작)
		 * limit 추출할 개수
		 */
		
		int countSchedule = session.selectOne("schedule.getCount", bean);
		RowBounds rows = new RowBounds(bean.getStart()-1, countSchedule);
		
//		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("schedule.searchAll", bean, rows);
	}

	
	@Override
	public int getCount(PageBean bean) {
		return session.selectOne("schedule.getCount", bean);
	}

	@Override
	public int getBoardNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Schedule> searchMySchedule(int no) {
		return session.selectList("schedule.searchMySchedule", no);
	}

}
