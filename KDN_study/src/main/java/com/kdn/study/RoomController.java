
package com.kdn.study;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.domain.RsvRoom;
import com.kdn.study.domain.Study;
import com.kdn.study.service.RoomService;
import com.kdn.study.service.StudyService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private StudyService studyService;
	
	
	@ExceptionHandler
	public ModelAndView Handler(Exception e){
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); //request에 저장
		model.addObject("content", "ErrorHandler.jsp"); //request에 저장
		
		return model;
	}
	
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
		
		model.addAttribute("listcontent", "ReservedRoomCheck.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="reservedRoomForm.do", method=RequestMethod.GET)
	public String reservedRoomForm(Model model) {
		model.addAttribute("content", "room/RoomHome.jsp"); 
		model.addAttribute("listform", "RservedRoom.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="reservedRoom.do", method=RequestMethod.GET) //나중에는 post로 
	public String reservedRoom(Model model, String roomResvDate, HttpSession session) {
		
		List<HashMap<String, Integer>> dayRsvlist = roomService.searchDayRsv(roomResvDate);
		model.addAttribute("dayRsvlist", dayRsvlist);
		
		int empno = (Integer)session.getAttribute("empno");
		List<Study> myStudyList = studyService.searchMyStudy(empno);
		model.addAttribute("myStudyList", myStudyList);
		
		model.addAttribute("content", "room/RoomHome.jsp"); 
		model.addAttribute("listform", "RservedRoom.jsp");
		model.addAttribute("listcontent", "DayRsvRoomCheck.jsp");
		
		return "index";
	}
	
	
	@RequestMapping(value="reserveRoom.do", method=RequestMethod.POST)
	public String reserveRoom(RsvRoom rsvroom, Model model) {
			
		roomService.reserveRoom(rsvroom);
		
		return "redirect:reservedRoomForm.do";
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
