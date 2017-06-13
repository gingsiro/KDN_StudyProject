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
import com.kdn.study.domain.JoinStudy;
import com.kdn.study.domain.PageBean;
import com.kdn.study.service.BoardService;
import com.kdn.study.service.JoinService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private JoinService joinService;

	@ExceptionHandler
	public ModelAndView Handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage()); // request에 저장
		model.addObject("content", "ErrorHandler.jsp"); // request에 저장

		return model;
	}

	@RequestMapping(value = "boardList.do", method = RequestMethod.GET)
	public String boardList(Model model, String sno, PageBean bean) { // url전달정보
																		// string,,

		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/BoardList.jsp");

		bean.setSno(sno);
		model.addAttribute("sno", Integer.parseInt(sno));

		List<Board> boardList = boardService.boardSearchAll(bean);
		model.addAttribute("boardList", boardList);
		
		int int_sno = Integer.parseInt(sno);
		List<JoinStudy> joinMembers_list = joinService.searchJoinMembers(int_sno);
		model.addAttribute("joinMembers_list", joinMembers_list);

		return "index";
	}

	@RequestMapping(value = "searchBoard.do", method = RequestMethod.GET)
	public String searchBoard(int no, Model model, int sno) {
		model.addAttribute("board", boardService.search(no));

		model.addAttribute("sno", sno);
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/SearchBoard.jsp");

		return "index";

	}

	@RequestMapping(value = "updateBoard.do", method = RequestMethod.GET)
	public String updateBoard(Model model, Board board, int sno) {
		System.out.println(board + "controller");
		boardService.update(board);

		model.addAttribute("sno", sno);
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/SearchBoard.jsp");
		return "index";

	}

	@RequestMapping(value = "deleteBoard.do", method = RequestMethod.GET)
	public String deleteBoard(Model model, Board board, int sno, int bno) {

		boardService.delete(bno);

		model.addAttribute("sno", Integer.toString(sno));
/*		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/BoardList.jsp");*/

		return "redirect:boardList.do";

	}

	@RequestMapping(value = "insertBoardForm.do", method = RequestMethod.GET)
	public String insertBoardForm(Model model, String sno) {

		int studyNo = Integer.parseInt(sno);

		int maxsbno = boardService.maxSbnoSearch(studyNo);

		model.addAttribute("sno", sno);
		model.addAttribute("maxsbno", ++maxsbno);
		model.addAttribute("content", "schedule/scheduleHome.jsp");
		model.addAttribute("listform", "../board/InsertBoard.jsp");

		return "index";

	}

	@RequestMapping(value = "insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(Model model, Board board, String sno) {

		System.out.println("insertBoard" + board);

		boardService.insert(board);
		model.addAttribute("sno", sno);

		return "redirect:boardList.do";

	}

}
