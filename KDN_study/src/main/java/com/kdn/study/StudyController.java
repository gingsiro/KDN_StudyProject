package com.kdn.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.domain.PageBean;
import com.kdn.study.domain.Study;
import com.kdn.study.service.CategoryService;
import com.kdn.study.service.StudyService;

@Controller
public class StudyController {
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private CategoryService categoryService;
	
	@ExceptionHandler
	public ModelAndView Handler(Exception e){
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); //request에 저장
		model.addObject("content", "ErrorHandler.jsp"); //request에 저장
		
		return model;
	}
	
	@RequestMapping(value="studyList.do", method=RequestMethod.GET)
	public String studyList(Model model, String key, String word, HttpSession session) {
		if(session.getAttribute("empno")==null){
			return "redirect:loginForm.do";
		}
		List<Study> list = null;
		if(session.getAttribute("empno")!=null){
			list = studyService.searchMyStudy(Integer.parseInt(session.getAttribute("empno").toString()));
			if(key!=null && key.equals("empno")){
				model.addAttribute("list", list);
				model.addAttribute("listform","MyStudyList.jsp");
			}else{
				PageBean bean = new PageBean(key, word);
				model.addAttribute("list", studyService.searchAll(bean));
				model.addAttribute("listform","StudyList.jsp");
			}
			
			model.addAttribute("myStudyList", list);
			model.addAttribute("content", "study/StudyHome.jsp");
			model.addAttribute("categoryList", categoryService.searchAll(new PageBean("all", null)));	
			/*for (int i = 0; i < 5; i++) {
				model.addAttribute("room"+i, studyService.searchAll(bean));
			}
			*/
			return "index";
		}else{
			return "redirect:loginForm.do";
		}
	}
	
	@RequestMapping(value="createStudy.do", method=RequestMethod.POST)
	public String createStudy(Model model, Study study){
		studyService.createStudy(study);
		return "redirect:studyList.do";
	}
	
	@RequestMapping(value="updateStudy.do", method=RequestMethod.POST)
	public String updateStudy(Model model, Study study){
		studyService.updateStudy(study);
		return "redirect:studyList.do";
	}

	@RequestMapping(value="joinStudy.do", method=RequestMethod.POST)
	public String joinStudy(Model model, HttpSession session, String sno){
		studyService.joinStudy(Integer.parseInt(session.getAttribute("empno").toString()), Integer.parseInt(sno));
		return "index";
	}
	
	
}
