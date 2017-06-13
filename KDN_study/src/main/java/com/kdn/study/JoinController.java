package com.kdn.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kdn.study.domain.JoinStudy;
import com.kdn.study.domain.Study;
import com.kdn.study.service.JoinService;
import com.kdn.study.service.StudyService;

@Controller
public class JoinController 
{
	@Autowired
	private JoinService joinService;
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value="joinList.do", method=RequestMethod.GET)
	public String joinList(Model model, HttpSession session, String sno)
	{
		int int_sno = Integer.parseInt(sno);
		List<JoinStudy> joinMembers_list = joinService.searchJoinMembers(int_sno);
		model.addAttribute("joinMembers_list", joinMembers_list);
		
		model.addAttribute("sno", sno);
		
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../study/JoinList.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(String jno, String sno, String scurr)
	{
		System.out.println("jno>>>"+jno);
		System.out.println("sno>>>"+sno);
		System.out.println("scurr>>>"+scurr);
		
		Study study = studyService.search(Integer.parseInt(sno));

		int int_scurr = Integer.parseInt(scurr)-1;
		study.setScurr(int_scurr);
		
		studyService.updateStudy(study);
		joinService.deleteMember(Integer.parseInt(jno));
		
		
		return "redirect:joinList.do?sno="+sno;
	}
}
