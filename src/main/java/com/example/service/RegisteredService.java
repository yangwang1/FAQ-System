package com.example.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.User;
import com.example.entities.UserRole;
import com.example.repository.UserRepository;
import com.example.repository.UserRoleRepository;


/**
 * 注册
 * @author wangwang
 *
 */
@Service
public class RegisteredService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional(readOnly=true)
	public User getByUsername(String username){
		return userRepository.getByUsername(username);
	}
	
	@Transactional
	public void registered(String username, String password, String mailbox, Date birth){
		
		System.out.println("RegisteredService");
		List<UserRole> list = new ArrayList<>();
		
		UserRole userRole = new UserRole();
		userRole.setUsername(username);
		userRole.setRolename("ROLE_USER");
		list.add(userRole);
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setMailbox(mailbox);
		user.setBirth(birth);
		user.setEnabled(1);
		user.setUserrole(list);
		userRepository.saveAndFlush(user);
			
	}
}
