package com.kdn.study;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController 
{
	@RequestMapping(value="calendar.do", method=RequestMethod.GET)
	public String scheduleStudy(Model model) {
		
		model.addAttribute("content", "schedule/Calendar.jsp");
		
		return "index";
	}
	
}
