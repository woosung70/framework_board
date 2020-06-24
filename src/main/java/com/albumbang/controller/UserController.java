package com.albumbang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.albumbang.domain.User;
import com.albumbang.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/list.do")
	public String list(Model model) {
		List<User> list = userService.getUserList();
		model.addAttribute("list", list);
		return "/user/list";
	}

	@RequestMapping("/view.do")
	public ModelAndView getWirte(@RequestParam String user_id) {
		User user = userService.getUser(user_id);
		return new ModelAndView("/user/view","user",user);
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView insertUserForm() {	
		List<String> genderList = new ArrayList<String>();
		genderList.add("남");
		genderList.add("여");

		List<String> cityList = new ArrayList<String>();
		cityList.add("서울");
		cityList.add("부산");
		cityList.add("대구");
		cityList.add("제주");
		
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("genderList", genderList);
		map.put("cityList", cityList);
		
		return new ModelAndView("/user/write", "map", map);
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String posttWirte(@ModelAttribute User user) {		
		if (user != null)
			userService.insertUser(user);
		return "redirect:/user/list.do";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public ModelAndView getModify(@RequestParam String user_id) {
		User user = userService.getUser(user_id);	
		List<String> genderList = new ArrayList<String>();
		genderList.add("남");
		genderList.add("여");		
		List<String> cityList = new ArrayList<String>();
		cityList.add("서울");
		cityList.add("부산");
		cityList.add("대구");
		cityList.add("제주");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genderList", genderList);
		map.put("cityList", cityList);
		map.put("user", user);
		return new ModelAndView("/user/modify", "map", map);
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String postModify(@ModelAttribute User user) {
		System.out.println(user.toString());
		userService.updateUser(user);
		System.out.println(user.toString());
		return "redirect:/user/list.do";
	}
	
	@RequestMapping(value="/delete.do/{user_id}")
	public String deleteUser(@PathVariable String user_id) {
		userService.deleteUser(user_id);
		return "redirect:/user/list.do";
	}
	
	/*
	 * @RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public int login_check(User user, HttpSession session) {
	 * 
	 * int result = 0; String user_name = "테스트";//userService.loginCheck(true,
	 * session);
	 * 
	 * //로그인 성공, 실패 if( user_name != null && !user_name.equals("") ){ //로그인 성공
	 * result = 1; session.setAttribute("login_id", user.getUser_id());
	 * session.setAttribute("login_name", user_name);
	 * System.out.println(session.getAttribute("userid"));
	 * System.out.println(session.getAttribute("name")); }else { //로그인 실패 result =
	 * 0; }
	 * 
	 * return result; }
	 * 
	 * 
	 */	
	@ExceptionHandler
	public String handleException(Exception e) {
		return "/user/error";
	}
}
