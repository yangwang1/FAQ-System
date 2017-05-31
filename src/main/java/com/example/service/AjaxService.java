package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Problem;
import com.example.repository.ProblemRepository;

@Service
public class AjaxService {

	@Autowired
	private ProblemRepository problemRepository;
	
	/**
	 * 查询包含关键字的所有问题
	 * @param title
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<Problem> getTitles(String title){
		return problemRepository.findByTitleContaining(title);
	}

}
