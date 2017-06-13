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
import com.kdn.study.domain.Employee;


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
	
	@RequestMapping(value="insertEmployee.do", method=RequestMethod.POST)
	public String insertEmployee(Employee employee, Model model)
	{
		employeeService.add(employee);
		model.addAttribute("content", "employee/login.jsp");
		return "index";
	}
	
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
		Employee emp = employeeService.search(empno);
		/*model.addAttribute("employee", employeeService.search(empno));*/
		session.setAttribute("ename", emp.getEname());
		session.setAttribute("dept", emp.getDept());
		
		
		session.setAttribute("empno", empno);
		session.setAttribute("admin", emp.getAdmin());
		System.out.println("emmm" +emp);
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
	
	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		int empno = (Integer)session.getAttribute("empno");
		model.addAttribute("employee", employeeService.search(empno));
		model.addAttribute("content", "employee/employeeInfo.jsp");
		
		return "index";
		
	}
	
	@RequestMapping(value="employeeUpdateForm.do", method=RequestMethod.GET)
	public String employeeUpdateForm(HttpSession session, Model model) {
		int empno = (Integer)session.getAttribute("empno");
		model.addAttribute("employee", employeeService.search(empno));
		model.addAttribute("content", "employee/updateEmployee.jsp");
		return "index";
	}
	
	/*@RequestMapping(value="employeeUpdateForm.do", method=RequestMethod.GET)
	public String employeeUpdateForm(Model model) {
		model.addAttribute("content", "employee/updateEmployee.jsp");
		return "index";
	}*/
	
	@RequestMapping(value="updateEmployee.do", method=RequestMethod.POST)
	public String updateEmployee(Employee employee, Model model) {
		System.out.println("update"+employee);
		employeeService.update(employee);
		model.addAttribute("content", "employee/employeeInfo.jsp");
		return "index";
	}
	
	
	
	
	
	
	@RequestMapping(value="employeeDeleteForm.do", method=RequestMethod.GET)
	public String employeeDeleteForm(HttpSession session, Model model) {
		int empno = (Integer)session.getAttribute("empno");
		model.addAttribute("employee", employeeService.search(empno));
		model.addAttribute("content", "employee/deleteEmployee.jsp");
		return "index";
	}
	
	@RequestMapping(value="deleteEmployee.do", method=RequestMethod.POST)
	public String deleteEmployee(Employee employee, Model model) {
		System.out.println("delete"+employee);
		employeeService.delete(employee);
		model.addAttribute("content", "employee/deleteinfo.jsp");
		return "index";
	}

	@RequestMapping(value="deletelogout.do", method=RequestMethod.POST)
	public String deletelogout(HttpSession session)
	{
		session.invalidate();
		return "index";
	}
	
	
	
	
	
	
	
	
	
	
	}	
