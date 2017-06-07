
package com.kdn.study;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoomController {
	
	@RequestMapping(value="roomList.do", method=RequestMethod.GET)
	public String roomList(Model model) {
		
		model.addAttribute("content", "room/RoomList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="reserveCheckRoom.do", method=RequestMethod.GET)
	public String reserveCheckRoom(Model model) {
		
		model.addAttribute("content", "room/ReservCheckRoom.jsp");
		
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
	
	@RequestMapping(value="reserveRoomForm.do", method=RequestMethod.POST)
	public String reserveRoomForm(Model model) {
		model.addAttribute("content", "room/ReservRoom.jsp");
		return "index";
	}
	
	@RequestMapping(value="reservRoom.do", method=RequestMethod.POST)
	public String reservRoom(Model model) {
		
		return "redirect:RoomList.do";
	}
	

	
	
	
	
	
}
