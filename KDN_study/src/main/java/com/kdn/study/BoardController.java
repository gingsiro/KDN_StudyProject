package com.kdn.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kdn.study.domain.Board;
import com.kdn.study.domain.PageBean;
import com.kdn.study.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@ExceptionHandler
	public ModelAndView Handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); // request에 저장
		model.addObject("content", "ErrorHandler.jsp"); // request에 저장

		return model;
	}
		
	@RequestMapping(value = "boardList.do", method = RequestMethod.GET)
	public String boardList(Model model, String sno, PageBean bean) {
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/BoardList.jsp");
		
		/*int studyNo = Integer.parseInt(sno);
		bean.setSno(studyNo);*/
		
		bean.setSno(sno);
		model.addAttribute("sno", sno);
		
		List<Board> boardList = boardService.boardSearchAll(bean);
		System.out.println(boardList);
		
		model.addAttribute("boardList", boardList);

		
		return "index";

	}
	
	@RequestMapping(value="searchBoard.do", method=RequestMethod.GET)
	public String searchBoard(int no, Model model, int sno) {
			model.addAttribute("board", boardService.search(no));
			
			model.addAttribute("sno", sno);
			model.addAttribute("content", "schedule/scheduleHome.jsp");
			model.addAttribute("listform", "../board/SearchBoard.jsp");
			
		return "index";
		
	}
	@RequestMapping(value="updateBoard.do", method=RequestMethod.GET)
	public String updateBoard(Model model, Board board) {
		boardService.update(board);
		
		//upeate진행중....
		/*model.addAttribute("board", boardService.search(no));
		
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/SearchBoard.jsp");
		*/
		return "index";
		
	}
	
}
