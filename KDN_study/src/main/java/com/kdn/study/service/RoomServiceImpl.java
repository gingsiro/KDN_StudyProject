package com.kdn.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.study.dao.RoomDao;
import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvCode;
import com.kdn.study.domain.RsvRoom;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	@Autowired
	@Qualifier("roomDao")
	private RoomDao dao;
	
	public List<Room> searchAll() {
		List<Room> roomlist = dao.searchAll();
		
		return roomlist;
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
	
	public void reserveRoom(RsvRoom rsvroom) {
		System.out.println("service>>>>>>>>>>>>>>>>>>>>"+rsvroom);
		dao.reserveRoom(rsvroom);
	}
	
	public List<RsvRoom> searchMyRsv(int empno) {
		List<RsvRoom> myRsv = dao.searchMyRsv(empno);
		
		return myRsv;
	}
	
	public void deleteRsvRoom(int rsvNo) {
		dao.deleteRsvRoom(rsvNo);
	}
	public void insertRoom(Room room) {
		dao.insertRoom(room);
		
	}
	
	public void updateRoom(Room room) {
		dao.updateRoom(room);
	}
	
	public void deleteRoom(int rno) {
		dao.deleteRoom(rno);
	}
	
	public List<RsvCode> timeCodeSearch() {
		return dao.timeCodeSearch();
		
	}
}
