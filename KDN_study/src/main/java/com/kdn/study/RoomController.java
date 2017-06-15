package com.kdn.study;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import com.kdn.study.domain.Room;
import com.kdn.study.domain.RsvCode;
import com.kdn.study.domain.RsvRoom;
import com.kdn.study.domain.Study;
import com.kdn.study.service.RoomService;
import com.kdn.study.service.StudyService;
import com.kdn.study.util.TimeCheck;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private StudyService studyService;

	@ExceptionHandler
	public ModelAndView Handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); // request에 저장
		model.addObject("content", "ErrorHandler.jsp"); // request에 저장

		return model;
	}

	@RequestMapping(value = "reservedRoom.do", method = RequestMethod.GET)
	public String reservedRoom(Model model, String roomResvDate,
			HttpSession session) {
		if (session.getAttribute("empno") != null) {
			model.addAttribute("content", "room/RoomHome.jsp");
			model.addAttribute("listform", "RservedRoom.jsp");

			String today = TimeCheck.dayCheck();

			if (roomResvDate == null) {
				roomResvDate = today;
			}

			List<RsvCode> timeCodeTable = roomService.timeCodeSearch();
			
			int rsvcode = 0;
			if (roomResvDate != null) {
				rsvcode = TimeCheck.timeCodeCheck(roomResvDate, today, timeCodeTable);

			}
			int empno = (Integer) session.getAttribute("empno");
			List<HashMap<String, Integer>> dayRsvlist = roomService
					.searchDayRsv(roomResvDate);
			model.addAttribute("dayRsvlist", dayRsvlist);

			System.out.println(roomResvDate + "code: " + rsvcode + " / "
					+ dayRsvlist);

			List<Study> myStudyList = studyService.searchMyStudy(empno);
			model.addAttribute("myStudyList", myStudyList);

			model.addAttribute("rsvcode", rsvcode);
			model.addAttribute("roomResvDate", roomResvDate);

			return "index";
		} else {
			return "redirect:loginForm.do";
		}
	}

	@RequestMapping(value = "reserveRoom.do", method = RequestMethod.POST)
	public String reserveRoom(RsvRoom rsvroom, Model model) {

		roomService.reserveRoom(rsvroom);

		return "redirect:myRsvList.do";
	}

	@RequestMapping(value = "myRsvList.do", method = RequestMethod.GET)
	public String myRsvList(Model model, HttpSession session) {
		if (session.getAttribute("empno") != null) {
		model.addAttribute("content", "room/RoomHome.jsp");
		model.addAttribute("listform", "ReservedRoomCheck.jsp");

		String today = TimeCheck.dayCheck();
		List<RsvCode> timeCodeTable = roomService.timeCodeSearch();
		int rsvcode = TimeCheck.timeCodeCheck(today, today, timeCodeTable);
		
		
		int empno = (Integer) session.getAttribute("empno");
		List<RsvRoom> myRsvList = roomService.searchMyRsv(empno);

		model.addAttribute("myRsvList", myRsvList);
		model.addAttribute("today", today);
		model.addAttribute("rsvcode", rsvcode);
		
		return "index";
		} else {
			return "redirect:loginForm.do";
		}

	}

	@RequestMapping(value = "deleteRsvRoom.do", method = RequestMethod.POST)
	public String deleteRsvRoom(String rsvno) {
		int rsvNo = Integer.parseInt(rsvno);
		roomService.deleteRsvRoom(rsvNo);

		return "redirect:myRsvList.do";

	}

	@RequestMapping(value = "roomList.do", method = RequestMethod.GET)
	public String insertRoomForm(Model model) {
		model.addAttribute("content", "room/RoomHome.jsp");
		model.addAttribute("listform", "RoomList.jsp");

		List<Room> roomList = roomService.searchAll();
		System.out.println(roomList);
		model.addAttribute("roomList", roomList);

		return "index";
	}

	@RequestMapping(value = "insertRoom.do", method = RequestMethod.POST)
	public String insertRoom(Room room) {
		roomService.insertRoom(room);

		return "redirect:roomList.do";
	}

	@RequestMapping(value = "updateRoom.do", method = RequestMethod.POST)
	public String updateRoom(Room room) {
		roomService.updateRoom(room);

		return "redirect:roomList.do";
	}

	@RequestMapping(value = "deleteRoom.do", method = RequestMethod.POST)
	public String deleteRoom(int rno) {

		roomService.deleteRoom(rno);

		return "redirect:roomList.do";
	}

}
