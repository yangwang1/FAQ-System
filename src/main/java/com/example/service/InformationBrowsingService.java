package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Information;
import com.example.repository.InformationRepository;

/**
 * 信息浏览模块service
 * @author wangwang
 *
 */
@Service
public class InformationBrowsingService {

	@Autowired
	private InformationRepository informationRepository;
	
	/**
	 * 分页
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Information> getPage(int pageNo, int pageSize){
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize);
		return informationRepository.findAll(pageable);
	}
}
