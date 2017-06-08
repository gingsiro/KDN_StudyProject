package com.kdn.study.service;

import java.util.List;

import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvRoom;

public interface RoomService {
	public Room search(int rno);
	
	public List<RsvRoom> rsvRoomSearch(String roomdate);
	
}