package com.albumbang.service;

import java.util.List;

import com.albumbang.domain.User;

public interface UserService {
	
	public void insertUser(User user);

	public List<User> getUserList();

	public void deleteUser(String id);

	public User getUser(String id);

	public void updateUser(User user);
	
	public String loginCheck(User user);
	
}
