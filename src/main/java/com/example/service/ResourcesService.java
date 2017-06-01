package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Resources;
import com.example.repository.ResourcesRepository;

/**
 * 资源service
 * @author wangwang
 *
 */
@Service
public class ResourcesService {
	
	@Autowired
	private ResourcesRepository resourcesRepository;

	/**
	 * 分页
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Resources> getPage(int pageNo, int pageSize){
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize);
		return resourcesRepository.findAll(pageable);
	}
}
