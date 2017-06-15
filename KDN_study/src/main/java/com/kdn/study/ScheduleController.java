package com.kdn.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.domain.JoinStudy;
import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Schedule;
import com.kdn.study.service.JoinService;
import com.kdn.study.service.ScheduleService;
import com.kdn.study.service.StudyService;

@Controller
public class ScheduleController 
{
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping(value="listSchedule.do", method=RequestMethod.GET)
	public String listSchedule(PageBean bean, Model model, HttpSession session, String sno)
	{
		List<Schedule> list = scheduleService.searchAllForCalendar(bean);
		model.addAttribute("listschedule", list);
		
		List<Schedule> right_list = scheduleService.searchAllForRightList(bean);
		model.addAttribute("right_list", right_list);
		
		int int_sno = Integer.parseInt(sno);
		List<JoinStudy> joinMembers_list = joinService.searchJoinMembers(int_sno);
		model.addAttribute("joinMembers_list", joinMembers_list);
		
		//model.addAttribute("content", "schedule/listSchedule.jsp");
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "listSchedule.jsp");
		model.addAttribute("studyList", studyService.searchAll(new PageBean("all", null)));
		model.addAttribute("sno", sno);
		model.addAttribute("myScheduleOfStudyList", scheduleService.searchMySchedule(Integer.parseInt(session.getAttribute("empno").toString())));
		
		return "index";
	}

	@RequestMapping(value="insertSchedule.do", method=RequestMethod.POST)
	public String insertSchedule(Model model, String sno, String scno, String scdate, String sctitle){
		
		// 빼지마요 빼면 에러나엽
		String s = scdate;
		String s2 = s.substring(0,10);
		String s3 = s.substring(11, 16);
		String s4 = s2 + s3;
		
		// 줄바꿈 위해
		String title = "\\n" + sctitle;
		if(12 < title.length())
		{
			title = title.substring(0,12) + "\\n" + title.substring(12,title.length());
		}
		
//		2017-06-13T15:02
		scheduleService.insertSchedule(new Schedule(Integer.parseInt(scno), title, s4, Integer.parseInt(sno)));
		return "redirect:listSchedule.do?sno=" + sno;
	}

	
	@RequestMapping(value="schedule.do", method=RequestMethod.GET)
	public String scheduleStudy(Model model, PageBean bean)
	{
		List<Schedule> list = scheduleService.searchAllForCalendar(bean);
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
	
	@RequestMapping(value="updateSchedule.do", method=RequestMethod.GET)
	public String updateSchedule(Schedule schedule, String sno, String scno){
		
		// 빼지마요 빼면 에러나엽
		String mydate = schedule.getScdate();
		String front_date = mydate.substring(0,10);
		String rear_date = mydate.substring(11, 16);
		mydate = front_date + rear_date;
		schedule.setScdate(mydate);
		schedule.setScno(Integer.parseInt(scno));
		
		String title = "\\n" + schedule.getSctitle();
		if(12 < title.length())
		{
			title = title.substring(0,12) + "\\n" + title.substring(12,title.length());
		}
		
		schedule.setSctitle(title);
		scheduleService.updateSchedule(schedule);

		return "redirect:listSchedule.do?sno="+sno;
	}
	
	@RequestMapping(value="calendar.do", method=RequestMethod.GET)
	public String showCalendar(Model model)
	{
		model.addAttribute("content", "schedule/calendar.jsp");
		
		return "index";
	}
	
	@RequestMapping(value="deleteSchedule.do", method=RequestMethod.GET)
	public String deleteSchedule(String scno, String sno){
		System.out.println("controller>>>>>>>>" + sno);
		scheduleService.deleteSchedule(Integer.parseInt(scno));
		return "redirect:listSchedule.do?sno="+sno;
	}
}
