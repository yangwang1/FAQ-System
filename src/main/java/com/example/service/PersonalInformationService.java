package com.example.service;

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

import com.example.entities.Announcement;
import com.example.entities.Information;
import com.example.entities.User;
import com.example.repository.AnnouncementRepository;
import com.example.repository.InformationRepository;
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
	@Autowired
	private InformationRepository informationRepository;
	@Autowired
	private AnnouncementRepository announcementRepository;
	
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
	
	/**
	 * 带查询条件的分页，查询全部回答者姓名为username的问题，并按提问时间倒叙排序进行返回；
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Information> getMyAnswerPage(int pageNo, int pageSize,String username){
		
		Order order = new Order(Direction.DESC, "title.time"); //根据提问时间降序排序
		Sort sort = new Sort(order);
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);

		Specification<Information> specification = new Specification<Information>(){  //匿名内部类

			@Override
			public Predicate toPredicate(Root<Information> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				
				Path path = arg0.get("content").get("username");  //导航到查询条件需要的属性
				Predicate predicate = arg2.equal(path, username);  //这个属性为空
				return predicate;
			}};

		return informationRepository.findAll(specification, pageable);
	}
	
	/**
	 * 带查询条件的分页，查询全部用户名为username问题，并按提问时间倒叙排序进行返回；
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Information> getMyAskPage(int pageNo, int pageSize,String username){
		
		Order order = new Order(Direction.DESC, "title.time"); //根据提问时间降序排序
		Sort sort = new Sort(order);
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);

		Specification<Information> specification = new Specification<Information>(){  //匿名内部类

			@Override
			public Predicate toPredicate(Root<Information> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				
				Path path = arg0.get("title").get("username");  //导航到查询条件需要的属性
				Predicate predicate = arg2.equal(path, username);  //这个属性为空
				return predicate;
			}};

		return informationRepository.findAll(specification, pageable);
	}
	
	/**
	 * 带查询条件的分页，查询全部发布人为username的公告，并按提问时间倒叙排序进行返回；
	 * @param pageNo
	 * @param pageSize
	 * @param username
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Announcement> getMyAnnouncementPage(int pageNo, int pageSize,String username){
		
		Order order = new Order(Direction.DESC, "creatTime"); //根据提问时间降序排序
		Sort sort = new Sort(order);
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);

		Specification<Announcement> specification = new Specification<Announcement>(){  //匿名内部类

			@Override
			public Predicate toPredicate(Root<Announcement> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				
				Path path = arg0.get("username");  //导航到查询条件需要的属性
				Predicate predicate = arg2.equal(path, username);  //这个属性为空
				return predicate;
			}};

		return announcementRepository.findAll(specification, pageable);
	}



}
