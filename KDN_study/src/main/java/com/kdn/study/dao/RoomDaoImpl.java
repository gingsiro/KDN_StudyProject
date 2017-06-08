package com.kdn.study.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvRoom;

@Repository("roomDao")
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	public Room search(int rno) {
		return session.selectOne("room.search");

	}

	public void insert(Room room) {

	}

	public void delete(int rno) {

	}
	
	public List<RsvRoom> rsvRoomSearch(String roomdate) {
		return session.selectList("rsvroom.rsvRoomSearch", roomdate);
		
		
	}

}
