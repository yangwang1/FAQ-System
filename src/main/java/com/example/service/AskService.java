package com.example.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Information;
import com.example.entities.Problem;
import com.example.repository.InformationRepository;
import com.example.repository.ProblemRepository;

/**
 * 学生提问模块service
 * @author wangwang
 *
 */
@Service
public class AskService {
	
	@Autowired
	private InformationRepository informationRepository;
	
	@Autowired
	private ProblemRepository problemRepository;
	
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

	
	/**
	 * 带查询条件的分页，查询标题含有输入内容的问题，并按提问时间倒叙排序进行返回；
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Information> getInformations(int pageNo, int pageSize, String title){
		
		Order order = new Order(Direction.DESC, "title.time"); //根据提问时间降序排序
		Sort sort = new Sort(order);
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);

		Specification<Information> specification = new Specification<Information>(){  //匿名内部类

			@Override
			public Predicate toPredicate(Root<Information> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				
				Path path = arg0.get("title").get("title");  //导航到查询条件需要的属性
				Predicate predicate = arg2.like(path, "%" + title + "%");   //这个属性包含title
				return predicate;
			}};

		return informationRepository.findAll(specification, pageable);
	}


}
