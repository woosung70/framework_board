package com.albumbang.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "users")
public class UserXML {
	private String status;
	private List<User> userList;

	public UserXML() {}

	public UserXML(String status, List<User> userList) {
		this.status = status;
		this.userList = userList;
	}
	@XmlElement
	public void setStatus(String status) { this.status = status; }
	
	@XmlElement(name="user")
	public void setUserList(List<User> userList) { this.userList = userList; }
	
	public String getStatus() { return status; }
	public List<User> getUserList() { return userList; }
}
