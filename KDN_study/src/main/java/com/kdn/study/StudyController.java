package com.kdn.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.service.StudyService;

@Controller
public class StudyController {
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value="studyList.do", method=RequestMethod.GET)
	public String roomList(Model model) {
		
		model.addAttribute("content", "study/studyHome.jsp");
		model.addAttribute("list","studyList.jsp");
		model.addAttribute("study", studyService.search(20));
		
		return "index";
	}
}
