package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Information;
import com.example.repository.InformationRepository;

@Service
public class AjaxService {

	@Autowired
	private InformationRepository informationRepository;
	
	/**
	 * 查询包含关键字的所有问题
	 * @param title
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<Information> getTitles(String title){
		return informationRepository.findByTitleContaining(title);
	}

}
