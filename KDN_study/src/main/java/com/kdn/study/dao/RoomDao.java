package com.kdn.study.dao;

import java.util.HashMap;
import java.util.List;

import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvRoom;

public interface RoomDao {
	
	public List<Room> searchAll();

	public List<RsvRoom> rsvRoomSearchAll(String roomdate);
	public List<HashMap<String, Integer>> searchDayRsv(String roomResvDate);
	
	public void reserveRoom(RsvRoom rsvroom);
	public List<RsvRoom> searchMyRsv(int empno);
	public void deleteRsvRoom(int rsvNo);
	
}
