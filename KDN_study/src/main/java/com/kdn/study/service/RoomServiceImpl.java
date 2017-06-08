package com.kdn.study.service;

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
	
	public List<RsvRoom> rsvRoomSearch(String roomdate) {
		List<RsvRoom> rsvRooms = dao.rsvRoomSearch(roomdate);
		
		return rsvRooms;
		
	}
}
