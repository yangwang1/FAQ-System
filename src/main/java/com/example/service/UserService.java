package com.example.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.User;
import com.example.entities.UserRole;
import com.example.repository.UserRepository;

/**
 * user的分页
 * @author wangwang
 *
 */
@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public void delete(Integer id){
		userRepository.delete(id);
	}
	
	@Transactional(readOnly = true)
	public User get(Integer id){
		return userRepository.findOne(id);
	}
	
	@Transactional
	public void save(User user){
		
		System.out.println("RegisteredService");
		List<UserRole> list = new ArrayList<>();
		
		UserRole userRole = new UserRole();
		userRole.setUsername(user.getUsername());
		userRole.setRolename("ROLE_USER");
		list.add(userRole);
		
		user.setEnabled(1);
		user.setUserrole(list);
		userRepository.saveAndFlush(user);
			
	}
	
	/**
	 * 分页
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<User> getPage(int pageNo, int pageSize){
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize);
		return userRepository.findAll(pageable);
	}

}
