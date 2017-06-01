package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.entities.Announcement;
import com.example.service.AnnouncementService;
/**
 * 发布公告模块Controller
 * @author wangwang
 *
 */
@RequestMapping(value = "/announce")
@Controller
public class AnnounceController {
	
	@Autowired
	private AnnouncementService announcementService;

	@RequestMapping(value = "/announce")
	public String basic(){
		return "announce";
	}
	
	/**
	 * 发布公告，保存成功后返回
	 * @param announcement
	 * @return
	 */
	@RequestMapping(value = "/release", method = RequestMethod.POST)
	public String saveAnnouncement(Announcement announcement){
		announcementService.save(announcement);
		return "announceSuccessPage";
	}
	
	/**
	 * 根据id获取公告内容进行回显
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/watch/{id}")
	public String getAnnouncement(@PathVariable("id") Integer id, Map<String, Object> map){
		Announcement announcement = announcementService.getAnnouncement(id);
		map.put("announcement", announcement);
		return "announcement";
	}
	
}
