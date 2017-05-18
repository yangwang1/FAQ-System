package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.User;
import com.example.repository.UserRepository;

/**
 * 个人信息模块service
 * @author wangwang
 *
 */
@Service
public class PersonalInformationService {
	
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 通过用户名获取用户信息
	 * @param username
	 * @return
	 */
	@Transactional(readOnly = true)
	public User getUserInformation(String username){
		return userRepository.getByUsername(username);
	}
	
	/**
	 * 通过id查询用户信息，传给modelattribute
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = true)
	public User get(Integer id){
		return userRepository.findOne(id);
	}
	
	/**
	 * 保存修改后的个人信息
	 * @param user
	 */
	@Transactional
	public void save(User user){
		userRepository.saveAndFlush(user);
	}

}
