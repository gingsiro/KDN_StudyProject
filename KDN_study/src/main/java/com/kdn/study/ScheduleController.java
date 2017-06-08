package com.kdn.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.service.ScheduleService;

@Controller
public class ScheduleController 
{
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="schedule.do", method=RequestMethod.GET)
	public String scheduleStudy(Model model)
	{
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("list","listSchedule.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="listSchedule.do", method=RequestMethod.GET)
	public String listSchedule(PageBean bean, Model model)
	{
		List<Schedule> list = scheduleService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "schedule/listSchedule.jsp");
		
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
	
	
	
	
}
