package com.kdn.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.domain.Category;
import com.kdn.study.domain.PageBean;
import com.kdn.study.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@ExceptionHandler
	public ModelAndView Handler(Exception e){
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); //request에 저장
		model.addObject("content", "ErrorHandler.jsp"); //request에 저장
		
		return model;
	}
	
	@RequestMapping(value="categoryList.do", method=RequestMethod.GET)
	public String categoryList(Model model, String key, String word) {
		
		PageBean bean = new PageBean(key, word);
		model.addAttribute("list",categoryService.searchAll(bean));
		model.addAttribute("listform", "../category/categoryList.jsp");
		model.addAttribute("content", "study/StudyHome.jsp");
		return "index";
	}
	
	@RequestMapping(value="createCategory.do", method=RequestMethod.POST)
	public String createCategory(String cname) {
		categoryService.createCategory(cname);
		return "redirect:categoryList.do";
	}
	
	@RequestMapping(value="deleteCategory.do", method=RequestMethod.POST)
	public String deleteCategory(String cno) {
		categoryService.deleteCategory(Integer.parseInt(cno));
		return "redirect:categoryList.do";
	}
	
	@RequestMapping(value="updateCategory.do", method=RequestMethod.POST)
	public String updateCategory(String cno, String cname) {
		Category cat = new Category(Integer.parseInt(cno), cname);
		categoryService.updateCategory(cat);
		return "redirect:categoryList.do";
	}
	
}
