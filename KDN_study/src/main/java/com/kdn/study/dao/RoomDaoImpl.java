package com.kdn.study.dao;

import java.util.HashMap;
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
	
	
	public List<Room> searchAll() {
		return session.selectList("room.searchAll");

	}
	
	public List<RsvRoom> rsvRoomSearchAll(String roomdate) {
		return session.selectList("rsvroom.searchAll", roomdate);
	}
	
	public List<HashMap<String, Integer>> searchDayRsv(String roomResvDate){
		System.out.println("dao>>>>>>>>>>>>>>>>>>>"+roomResvDate);
		return session.selectList("rsvroom.searchDayRsv", roomResvDate);
	}
	
	public void reserveRoom(RsvRoom rsvroom) {
		System.out.println("dao>>>>>>>>>>>>>>>>>>>"+rsvroom);
		session.insert("rsvroom.reserveRoom", rsvroom);
		
	}
	public List<RsvRoom> searchMyRsv(int empno) {
		return session.selectList("rsvroom.searchMyRsv", empno);
	}
	
	public void deleteRsvRoom(int rsvNo) {
		session.delete("rsvroom.deleteRsvRoom", rsvNo);
	}
	
	
	public void insertRoom(Room room) {
		session.insert("room.insertRoom", room);
	}
	

	public void updateRoom(Room room) {
		session.update("room.updateRoom", room);
		
	}
	
	public void deleteRoom(int rno) {
		session.delete("room.deleteRoom", rno);
	}
}
