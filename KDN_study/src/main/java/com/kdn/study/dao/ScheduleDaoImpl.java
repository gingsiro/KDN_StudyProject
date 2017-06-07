package com.kdn.study.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.Schedule;
import com.kdn.study.domain.Study;

@Repository("scheduleDao")
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public Schedule search(int no) {
		return session.selectOne("schedule.search", no);
	}

}
