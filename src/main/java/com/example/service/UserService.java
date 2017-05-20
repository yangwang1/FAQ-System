package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.User;
import com.example.repository.UserRepository;

/**
 * 后台管理服务
 * @author wangwang
 *
 */
@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 后台管理删除用户
	 * @param id
	 */
	@Transactional
	public void delete(Integer id){
		userRepository.delete(id);
	}
	
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = true)
	public User get(Integer id){
		return userRepository.findOne(id);
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	@Transactional
	public void save(User user){
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
