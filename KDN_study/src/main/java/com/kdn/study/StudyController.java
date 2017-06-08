package com.kdn.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.domain.PageBean;
import com.kdn.study.service.StudyService;

@Controller
public class StudyController {
	@Autowired
	private StudyService studyService;
	
	@ExceptionHandler
	public ModelAndView Handler(Exception e){
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); //request에 저장
		model.addObject("content", "ErrorHandler.jsp"); //request에 저장
		
		return model;
	}
	
	@RequestMapping(value="studyList.do", method=RequestMethod.GET)
	public String studyList(Model model, String key, String word) {
		PageBean bean = new PageBean(key, word);
		model.addAttribute("list", studyService.searchAll(bean));
		model.addAttribute("content", "study/studyHome.jsp");
		model.addAttribute("listform","studyList.jsp");
		
		return "index";
	}
	
}
