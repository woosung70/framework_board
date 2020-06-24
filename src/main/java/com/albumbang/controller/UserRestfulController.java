package com.albumbang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.albumbang.domain.User;
import com.albumbang.domain.UserXML;
import com.albumbang.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserRestfulController {
	@Autowired
	private UserService userService;

	@RequestMapping("/userList_Json.do")
	public String user_json(Model model) {
		return "/user/userList_Json";
	}

	@RequestMapping("/userList_Xml.do")
	public String user_xml(Model model) {
		return "/user/userList_Xml";
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	@ResponseBody
	public Map getUserList() {
		List<User> userList = userService.getUserList();
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		result.put("data", userList);
		return result;
	}

	@RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map getUser(@PathVariable String id) {
		User user = userService.getUser(id);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		result.put("data", user);
		return result;
	}

	@RequestMapping(value = "/users", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	@ResponseBody
	public Map insertUser(@RequestBody User user) {
		if (user != null)
			userService.insertUser(user);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		return result;
	}

	@RequestMapping(value = "/users", method = RequestMethod.PUT, headers = { "Content-type=application/json" })
	@ResponseBody
	public Map updateUser(@RequestBody User user) {
		if (user != null)
			userService.updateUser(user);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		return result;
	}

	@RequestMapping(value = "/users/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Map deleteUser(@PathVariable String id) {
		userService.deleteUser(id);
		Map result = new HashMap();
		result.put("result", Boolean.TRUE);
		return result;
	}

	@RequestMapping(value = "/usersXml", method = RequestMethod.GET)
	@ResponseBody
	public UserXML getUserListXml() {
		List<User> list = userService.getUserList();
		UserXML xml = new UserXML("success", list);
		return xml;
	}
}
