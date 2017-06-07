package com.kdn.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.service.ScheduleService;

@Controller
public class ScheduleController 
{
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="schedule.do", method=RequestMethod.GET)
	public String scheduleStudy(Model model) {
		
		//model.addAttribute("content", "schedule/fullcalendar-3.4.0/demos/theme.jsp");
		/*
		model.addAttribute("content", "schedule/calendarHome.jsp");
		model.addAttribute("list","calenarList.jsp");
		*/
		
		
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("list","scheduleList.jsp");
		//model.addAttribute("schedule", scheduleService.search(3));
		
		return "index";
	}
	
	
	@RequestMapping(value="searchSchedule.do", method=RequestMethod.GET)
	public String searchSchedule(String id, Model model)
	{
		
		System.out.println(id);
		int myNo = Integer.parseInt(id);
		System.out.println("searchSchedule>>>>>>1");
		model.addAttribute("schedule", scheduleService.search(myNo));
		
		System.out.println("searchSchedule>>>>>>2");
		model.addAttribute("content", "schedule/searchSchedule.jsp");
		
		System.out.println("searchSchedule>>>>>>3");
		
		
		
		return "index";
	}
}
