package com.example.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Announcement;
import com.example.repository.AnnouncementRepository;

/**
 * 发布公告模块service
 * @author wangwang
 *
 */
@Service
public class AnnouncementService {

	@Autowired
	private AnnouncementRepository announcementRepository;
	
	/**
	 * 公告的保存
	 * @param announcement
	 */
	@Transactional
	public void save(Announcement announcement){
		announcement.setCreatTime(new Date());
		announcementRepository.saveAndFlush(announcement);
	}
	
	/**
	 * 根据id查询公告内容
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = true)
	public Announcement getAnnouncement(Integer id){
		return announcementRepository.findOne(id);
	}
	
	/**
	 * 根据id删除公告
	 * @param id
	 */
	@Transactional
	public void delete(Integer id){
		announcementRepository.delete(id);
	}
	
	/**
	 * 公告按时间倒序排列并分页
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly = true)
	public Page<Announcement> getAnnouncePage(int pageNo, int pageSize){
		
		Order order = new Order(Direction.DESC, "creatTime"); //根据提问时间降序排序
		Sort sort = new Sort(order);
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize, sort);
		return announcementRepository.findAll(pageable);
	}
}
