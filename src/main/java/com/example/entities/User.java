package com.example.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 用户实体类
 * @author wangwang
 *
 */
@Entity
public class User {
	
	private String username;  //用户名
	private String password;  //密码
	
	@GeneratedValue
	@Id
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
