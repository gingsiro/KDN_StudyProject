package com.kdn.study;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.service.EmployeeService;

@Controller
public class EmployeeController 
{
	@Autowired
	private EmployeeService employeeService;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e)
	{
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		
		return model;
	}
	
	@RequestMapping(value="insertEmployeeForm.do", method=RequestMethod.GET)
	public String insertemployeeForm(Model model)
	{
		model.addAttribute("content", "employee/insertEmployee.jsp");
		return "index";
	}
	
	/*@RequestMapping(value="insertEmployee.do", method=RequestMethod.POST)
	public String insertEmployee(Employee employee, Model model)
	{
		employeeService.add(employee);
		model.addAttribute("content", "employee/login.jsp");
		return "index";
	}*/
	
	@RequestMapping(value="loginForm.do", method=RequestMethod.GET)
	public String loginForm(Model model)
	{
		model.addAttribute("content", "employee/login.jsp");
		return "index";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, int empno, String password)
	{
		
		employeeService.login(empno, password);
		session.setAttribute("empno", empno);
		String referer = (String)session.getAttribute("referer");
		
		if(referer != null)
		{
			session.removeAttribute("referer");
			return "redirect:" +referer;
		}
		else
		{
			return "index";
		}
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session)
	{
		session.removeAttribute("empno");
		return "index";
	}
}