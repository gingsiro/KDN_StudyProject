package com.kdn.study;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.domain.JoinStudy;
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
		if(session.getAttribute("empno")!=null){
			if(key!=null && key.equals("empno")){
				model.addAttribute("list", studyService.searchMyStudy(Integer.parseInt(session.getAttribute("empno").toString())));
				model.addAttribute("listform","MyStudyList.jsp");
			}else{
				PageBean bean = new PageBean(key, word);
				model.addAttribute("list", studyService.searchAll(bean));
				model.addAttribute("listform","StudyList.jsp");
			}
			
			model.addAttribute("myStudyList", studyService.searchMyStudy(Integer.parseInt(session.getAttribute("empno").toString())));
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
	public String createStudy(HttpSession session, Study study){
		studyService.createStudy(study);
		return "redirect:studyList.do";
	}
	
	@RequestMapping(value="updateStudy.do", method=RequestMethod.POST)
	public String updateStudy(Study study){
		studyService.updateStudy(study);
		return "redirect:studyList.do";
	}

	@RequestMapping(value="joinStudy.do", method=RequestMethod.POST)
	public String joinStudy(HttpSession session, String sno){
		JoinStudy joinInfo = new JoinStudy(Integer.parseInt(session.getAttribute("empno").toString()), Integer.parseInt(sno));
		studyService.joinStudy(joinInfo);
		return "redirect:listSchedule.do?sno="+sno;
	}
	
	@RequestMapping(value="dismissStudy.do", method=RequestMethod.POST)
	public String dismissStudy(String empno, String sno){
		JoinStudy joinInfo = new JoinStudy(Integer.parseInt(empno), Integer.parseInt(sno));
		studyService.dismissStudy(joinInfo);
		return "redirect:studyList.do";
	}
	
	@RequestMapping(value="deleteStudy.do", method=RequestMethod.POST)
	public String deleteStudy(String sno){
		studyService.deleteStudy(Integer.parseInt(sno));
		return "redirect:studyList.do";
	}
}
