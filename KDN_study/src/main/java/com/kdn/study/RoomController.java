
package com.kdn.study;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.domain.RsvRoom;
import com.kdn.study.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value="roomList.do", method=RequestMethod.GET)
	public String roomList(Model model, String roomdate) {
		
		//model.addAttribute("room", roomService.search(1));
		model.addAttribute("content", "room/RoomHome.jsp"); 
		model.addAttribute("listform","RoomList.jsp");
		
		if(roomdate == null) {
			SimpleDateFormat date = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
			Date currentTime = new Date();
			roomdate = date.format(currentTime).toString();
		} 

		List<RsvRoom> rooms = roomService.rsvRoomSearchAll(roomdate);
		model.addAttribute("rooms", rooms);
		
		model.addAttribute("listcontent", "ReservCheckRoom.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="reserveRoomForm.do", method=RequestMethod.GET)
	public String reserveRoomForm(Model model) {
		model.addAttribute("content", "room/RoomHome.jsp"); 
		model.addAttribute("listform", "ReservRoom.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="reservRoom.do", method=RequestMethod.GET) //나중에는 post로 
	public String reservRoom(Model model, String roomResvDate) {
		
		List<HashMap<String, Integer>> dayRsvlist = roomService.searchDayRsv(roomResvDate);
		model.addAttribute("dayRsvlist", dayRsvlist);
		
		System.out.println(dayRsvlist.get(0));
		
		return "index";
	}
	
	
	
	@RequestMapping(value="reserveCheckRoom.do", method=RequestMethod.POST)
	public String reserveCheckRoom(Model model, String roomdate) {
		
/*		List<RsvRoom> rooms = roomService.rsvRoomSearch(roomdate);
		model.addAttribute("rooms", rooms );
		
		model.addAttribute("content", "room/RoomHome.jsp"); 
		model.addAttribute("listform","RoomList.jsp");
		model.addAttribute("listcontent", "ReservCheckRoom.jsp");
		
		System.out.println(rooms);*/
		
		return "index";
	}
	
	@RequestMapping(value="insertRoomForm.do", method=RequestMethod.GET)
	public String insertRoomForm(Model model) {
		model.addAttribute("content", "room/InsertRoom.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="insertRoom.do", method=RequestMethod.POST)
	public String insertRoom(Model model) {
		
		return "redirect:RoomList.do";
	}

	
	
	
	
	
}
