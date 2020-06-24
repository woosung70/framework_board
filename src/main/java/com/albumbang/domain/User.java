package com.albumbang.domain;

import java.util.Date;

public class User {

	private String user_id;
	private String password;
	private String user_name;
	private String email;
	private String gender;
	private String city;
	private String use_yn;
	private String reg_date;
	private String mod_date;

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", password=" + password + ", user_name=" + user_name + ", email=" + email
				+ ", gender=" + gender + ", city=" + city + ", use_yn=" + use_yn + ", reg_date=" + reg_date
				+ ", mod_date=" + mod_date + "]";
	}
}
