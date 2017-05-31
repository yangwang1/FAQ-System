package com.example.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Information;
import com.example.entities.Problem;
import com.example.repository.InformationRepository;

/**
 * 学生提问模块service
 * @author wangwang
 *
 */
@Service
public class AskService {
	
	@Autowired
	private InformationRepository informationRepository;
	
	/**
	 * 学生提问的保存操作
	 * @param title
	 * @param username
	 */
	@Transactional
	public void save(String title, String username){
		Problem problem = new Problem();
		problem.setTime(new Date());
		problem.setTitle(title);
		problem.setUsername(username);
		
		Information information = new Information();
		information.setTitle(problem);
		informationRepository.saveAndFlush(information);	
	}
}
