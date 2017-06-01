package com.example.service;

import java.util.Date;

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
import com.example.repository.InformationRepository;

/**
 * 教师答疑模块service
 * @author wangwang
 *
 */
@Service
public class AnswerService {
	
	@Autowired
	private InformationRepository informationRepository;
	
	/**
	 * 根据id获取information进行回显
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = true)
	public Information getInformation(Integer id){
		return informationRepository.findOne(id);
	}
	
	/**
	 * 回答问题后的保存
	 * @param information
	 * @param username
	 */
	@Transactional
	public void save(Information information, String username){
		information.getContent().setUsername(username);
		information.getContent().setTime(new Date());
		informationRepository.saveAndFlush(information);
	}
	
	/**
	 * 带查询条件的分页，查询全部答案为空的问题，并按提问时间倒叙排序进行返回；
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional
	public Page<Information> getPage(int pageNo, int pageSize){
		
		Order order = new Order(Direction.DESC, "title.time"); //根据提问时间降序排序
		Sort sort = new Sort(order);
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);

		Specification<Information> specification = new Specification<Information>(){  //匿名内部类

			@Override
			public Predicate toPredicate(Root<Information> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				
				Path path = arg0.get("content");  //导航到查询条件需要的属性
				Predicate predicate = arg2.isNull(path);   //这个属性为空
				return predicate;
			}};

		return informationRepository.findAll(specification, pageable);
	}

}
