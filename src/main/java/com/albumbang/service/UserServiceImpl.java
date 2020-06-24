package com.albumbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.albumbang.domain.User;
import com.albumbang.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userdao;

	@Override
	public void insertUser(User user) {
		userdao.insert(user);
	}

	public List<User> getUserList() {
		return userdao.list();
	}

	@Override
	public void deleteUser(String id) {
		userdao.delete(id);

	}

	@Override
	public User getUser(String id) {
		return userdao.view(id);
	}

	@Override
	public void updateUser(User user) {
		userdao.update(user);

	}

	@Override
	public String loginCheck(User user) {
		return userdao.loginCheck(user);

	}

}
