package com.albumbang.mapper;

import java.util.List;

import com.albumbang.domain.User;

public interface UserMapper {

	public void insert(User user);
	public void update(User user);
	public void delete(String user_id);
	public User view(String user_id);
	public List<User> list();
	public String loginCheck(User user);

}