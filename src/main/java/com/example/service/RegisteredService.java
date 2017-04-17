package com.example.service;

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
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Transactional
	public void registered(String username, String password){
		
		System.out.println("RegisteredService");
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setEnabled(1);
		userRepository.saveAndFlush(user);
		
		UserRole userRole = new UserRole();
		userRole.setUsername(username);
		userRole.setRolename("ROLE_USER");
		userRoleRepository.saveAndFlush(userRole);
		
		
	}

}
