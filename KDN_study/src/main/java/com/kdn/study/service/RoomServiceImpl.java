package com.kdn.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.RoomDao;
import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvRoom;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	@Autowired
	@Qualifier("roomDao")
	private RoomDao dao;
	
	public Room search(int rno) {
		Room room = dao.search(rno);
		
		return room;
	}
	
	public List<RsvRoom> rsvRoomSearchAll(String roomdate) {
		List<RsvRoom> rsvRooms = dao.rsvRoomSearchAll(roomdate);
		
		return rsvRooms;
		
	}
	
	public List<HashMap<String, Integer>> searchDayRsv(String roomResvDate) {
		System.out.println("service>>>>>>>>>>>>>>>>>>>>"+roomResvDate);
		List<HashMap<String, Integer>> dayRsvlist = dao.searchDayRsv(roomResvDate);
		
		return dayRsvlist;
		
		
	}
}
