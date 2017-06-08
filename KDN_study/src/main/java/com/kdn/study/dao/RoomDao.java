package com.kdn.study.dao;

import java.util.List;

import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvRoom;

public interface RoomDao {
	
	public Room search(int rno);
	public void insert(Room room);
	public void delete(int rno);
	
	public List<RsvRoom> rsvRoomSearch(String roomdate);
	
	

}
