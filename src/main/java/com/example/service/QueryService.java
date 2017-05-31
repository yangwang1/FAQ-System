package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Information;
import com.example.entities.Problem;
import com.example.repository.InformationRepository;
import com.example.repository.ProblemRepository;

/**
 * 查询service
 * @author wangwang
 *
 */
@Service
public class QueryService {
	
	@Autowired
	private InformationRepository informationRepository;
	
	@Autowired
	private ProblemRepository problemRepository;
	/**
	 * 查询包含关键字的所有问题
	 * @param title
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<Information> getInformations(String title){
		List<Problem> problems = problemRepository.findByTitleContaining(title);
		List<Information> informations = new ArrayList<>();
		for(int i = 0; i < problems.size(); i++){
			Information infor = informationRepository.findByTitle(problems.get(i));
			informations.add(infor);
		}
		return informations;
	}

}
