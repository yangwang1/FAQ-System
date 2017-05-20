package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.User;
import com.example.entities.UserRole;
import com.example.repository.UserRepository;


/**
 * 注册模块服务
 * @author wangwang
 *
 */
@Service
public class RegisteredService {
	
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 通过用户名查询,ajax验证用户名是否存在
	 * @param username
	 * @return
	 */
	@Transactional(readOnly=true)
	public User getByUsername(String username){
		return userRepository.getByUsername(username);
	}
	
	/**
	 * 注册
	 * @param username
	 * @param password
	 * @param mailbox
	 * @param birth
	 */
	@Transactional
	public void registered(String username, String password, String mailbox){
		
		UserRole userRole = new UserRole();
		userRole.setUsername(username);
		userRole.setRolename("ROLE_USER");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setMailbox(mailbox);
		user.setEnabled(1);
		user.setUserrole(userRole);
		userRepository.saveAndFlush(user);
			
	}
}
