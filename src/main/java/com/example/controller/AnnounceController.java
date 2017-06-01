package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Announcement;
import com.example.entities.Information;
import com.example.entities.User;
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
	
	@ModelAttribute
	public void getAnnounce(@RequestParam(value="id",required=false) Integer id,
			Map<String,Object> map){
		if(id!=null){
			Announcement announcement = announcementService.getAnnouncement(id);
			map.put("announcement", announcement);
		}
	}

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
		return "redirect:/announce/getAll";
	}
	
	/**
	 * 首页模块根据id获取公告内容进行回显
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
	
	/**
	 * 公告管理模块根据id查询进行回显
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/get/{id}")
	public String updateAnnouncement(@PathVariable("id") Integer id, Map<String, Object> map){
		Announcement announcement = announcementService.getAnnouncement(id);
		map.put("announcement", announcement);
		return "announcementContent";
	}
	
	/**
	 * 根据问题的id获取公告，返回给前台修改页面进行回显
	 * @return
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String get(@PathVariable("id") Integer id, Map<String,Object> map){
		Announcement announcement = announcementService.getAnnouncement(id);
		map.put("announcement", announcement);
		return "updateAnnouncement";
	}
	
	/**
	 * 公告修改后返回到修改前页面
	 * @param announcement
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/save/{id}", method = RequestMethod.PUT)
	public String save(Announcement announcement, @PathVariable("id") Integer id){
		announcementService.save(announcement);
		return "redirect:/announce/get/" + id;
	}
	/**
	 * 根据id删除公告
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String deleteAnnouncement(@PathVariable("id") Integer id){
		announcementService.delete(id);
		return "redirect:/announce/getAll";
	}
	
	/**
	 * 查询所有公告进行分页回显
	 * @param accouncePageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/getAll")
	private String getHome(@RequestParam(value = "accouncePageNo", required = false, defaultValue = "1") String accouncePageNoStr,
			 Map<String, Object> map){
		int accouncePageNo = 1;
		try{
			//对pageNo的校验
			accouncePageNo = Integer.parseInt(accouncePageNoStr);
			if(accouncePageNo < 1){
				accouncePageNo = 1;
			}	
		}catch(Exception e){}
		Page<Announcement> accouncePage = announcementService.getAnnouncePage(accouncePageNo, 5);
		map.put("accouncePage", accouncePage);
		return "allAnnouncement";
	}
	
}
