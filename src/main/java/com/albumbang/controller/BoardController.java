package com.albumbang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.albumbang.domain.Board;
import com.albumbang.domain.PageCriteria;
import com.albumbang.domain.PageMaker;
import com.albumbang.domain.User;
import com.albumbang.service.BoardService;
import com.albumbang.service.UserService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private UserService userService;

	// 게시물 목록
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView getList(PageCriteria cri, ModelAndView mav) throws Exception {
		System.out.println("keyword=" + cri.getKeyword());
		System.out.println("pageNum=" + cri.getPageNum());
		System.out.println("amount=" + cri.getAmount());
		List<Board> list = service.list(cri);

		int total = service.totalCount(cri);
		System.out.println("total=" + total);

		mav.addObject("keyword", cri.getKeyword());
		mav.addObject("total", total);
		mav.addObject("list", list);
		mav.addObject("paging", new PageMaker(cri, total));
		mav.setViewName("/board/list");
		return mav;
	}

	// 게시물 작성
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public void getWirte() throws Exception {

	}

	// 게시물 작성
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String posttWirte(Board vo) throws Exception {
		System.out.println(vo.toString());
		service.write(vo);

		return "redirect:/board/list.do";
	}

	// 게시물 조회
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public void getView(@RequestParam("idx") int idx, Model model) throws Exception {

		Board vo = service.view(idx);
		System.out.println("vo.getUser_id() ===> "+vo.getUser_id());

		model.addAttribute("view", vo);

	}

	// 게시물 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public void getModify(@RequestParam("idx") int idx, Model model) throws Exception {

		Board vo = service.view(idx);

		model.addAttribute("view", vo);
	}

	// 게시물 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String postModify(Board vo) throws Exception {
		System.out.println("vo.getIdx() ===> "+vo.getIdx());
		service.modify(vo);

		return "redirect:/board/view.do?idx=" + vo.getIdx();
	}
	
	// 게시물 삭제
	@RequestMapping(value="/delete.do/{idx}")
	public String delete(@PathVariable String idx) throws Exception {
		service.delete(idx);;
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	@ResponseBody
	public int login_check(@RequestParam("login_id") String login_id, @RequestParam("login_pw") String login_pw,
			HttpSession session) throws Exception {
		
		int result = 0; 
		
		User user = new User();
		user.setUser_id(login_id);
		user.setPassword(login_pw);
		System.out.println(user.toString());

		String user_name = userService.loginCheck(user);
		
		//로그인 성공, 실패
		if( user_name != null && !user_name.equals("") ){ //로그인 성공
			result = 1; 
			session.setAttribute("login_id", user.getUser_id());
			session.setAttribute("login_name", user_name);
			System.out.println(session.getAttribute("login_id"));
			System.out.println(session.getAttribute("login_name"));
		}else { //로그인 실패
			result = 0; 
		}
		
		return result;
	}
	
	@RequestMapping(value = "/logout.do")
	@ResponseBody
	public String logout(User user, HttpSession session) throws Exception {
		//세션 초기화
		session.invalidate();
		return "ok";
	}

	@ExceptionHandler
	public String handleException(Exception e) {
		return "/board/error";
	}
}
