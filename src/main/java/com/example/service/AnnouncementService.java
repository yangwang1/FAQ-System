package com.example.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
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
}
