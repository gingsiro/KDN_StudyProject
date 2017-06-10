package com.kdn.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.service.ScheduleService;
import com.kdn.study.service.StudyService;

@Controller
public class ScheduleController 
{
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value="listSchedule.do", method=RequestMethod.GET)
	public String listSchedule(PageBean bean, Model model, HttpSession session)
	{
		List<Schedule> list = scheduleService.searchAll(bean);
		model.addAttribute("listschedule", list);
		model.addAttribute("content", "schedule/listSchedule.jsp");
		
		model.addAttribute("studyList", studyService.searchAll(new PageBean("all", null)));
				
		return "index";
	}

	@RequestMapping(value="insertSchedule.do", method=RequestMethod.POST)
	public String insertSchedule(Model model, Schedule schedule){
		
		String s = schedule.getScdate();
		
		
		
		String s2 = s.substring(0,10);
		String s3 = s.substring(11, 16);
		
		System.out.println("s : "+ s);
		System.out.println("s2: " + s2);
		System.out.println("s3: " + s3);
		String s4 = s2 + s3;
		
		
		System.out.println("s4: " + s4);
		schedule.setScdate(s4);
		
		
//		2017-06-13T15:02
		
		scheduleService.insertSchedule(schedule);
		return "redirect:listSchedule.do";
	}
	
	
	/*
	@RequestMapping(value="insertSchedule.do", method=RequestMethod.GET)
	public String reservedRoom(Model model, String roomResvDate) 
	{
		List<Schedule> dayRsvlist = scheduleService.searchDayRsv(roomResvDate);
		model.addAttribute("dayRsvlist", dayRsvlist);
		
		System.out.println(dayRsvlist.get(0));
		
		model.addAttribute("content", "room/RoomHome.jsp"); 
		model.addAttribute("listform", "RservedRoom.jsp");
		model.addAttribute("listcontent", "DayRsvRoomCheck.jsp");
		
		return "index";
	}
	*/
	
	@RequestMapping(value="schedule.do", method=RequestMethod.GET)
	public String scheduleStudy(Model model, PageBean bean)
	{
		List<Schedule> list = scheduleService.searchAll(bean);
		for(Object obj:list){
			System.out.println(obj);
		}
		model.addAttribute("sList", list);
		model.addAttribute("list","listSchedule.jsp");
		
		return "index";
	}
	
	
	@RequestMapping(value="searchSchedule.do", method=RequestMethod.GET)
	public String searchSchedule(String id, Model model)
	{
		int no = Integer.parseInt(id);
		model.addAttribute("schedule", scheduleService.search(no));
		model.addAttribute("content", "schedule/searchSchedule.jsp");
		
		return "index";
	}
	
	
	@RequestMapping(value="calendar.do", method=RequestMethod.GET)
	public String showCalendar(Model model)
	{
		model.addAttribute("content", "schedule/calendar.jsp");
		
		return "index";
	}
}
