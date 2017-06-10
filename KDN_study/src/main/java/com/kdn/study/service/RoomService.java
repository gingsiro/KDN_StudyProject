package com.kdn.study.service;

import java.util.HashMap;
import java.util.List;

import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvRoom;

public interface RoomService {
	public Room search(int rno);
	public List<RsvRoom> rsvRoomSearchAll(String roomdate);
	public List<HashMap<String, Integer>> searchDayRsv(String roomResvDate);
	
	public void reserveRoom(RsvRoom rsvroom);
	public List<RsvRoom> searchMyRsv(int empno);
}
