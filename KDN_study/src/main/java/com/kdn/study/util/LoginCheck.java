package com.kdn.study.util;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public class LoginCheck {
	public static boolean check(Model model, HttpSession session, String url){
		String empno = (String)session.getAttribute("empno");
		if(empno==null){
			session.setAttribute("referer", url);
			model.addAttribute("content", "member/login.jsp");
			return false;
		}else{
			return true;
		}
	}
}
