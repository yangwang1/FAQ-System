package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Announcement;
import com.example.entities.Information;
import com.example.service.HomeService;

/**
 * 首页controller
 * @author wangwang
 *
 */
@RequestMapping(value = "/Home")
@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	/**
	 * 首页分页回显
	 * @param accouncePageNoStr
	 * @param titlePageNoStr
	 * @param contentPageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/home")
	private String getHome(@RequestParam(value = "accouncePageNo", required = false, defaultValue = "1") String accouncePageNoStr,
			 @RequestParam(value = "titlePageNo",required = false, defaultValue = "1") String titlePageNoStr,
			 @RequestParam(value = "contentPageNo", required = false, defaultValue = "1") String contentPageNoStr, 
			 Map<String, Object> map){
		int accouncePageNo = 1;
		int titlePageNo = 1;
		int contentPageNo = 1;
		try{
			//对pageNo的校验
			accouncePageNo = Integer.parseInt(accouncePageNoStr);
			titlePageNo = Integer.parseInt(titlePageNoStr);
			contentPageNo = Integer.parseInt(contentPageNoStr);
			if(accouncePageNo < 1){
				accouncePageNo = 1;
			}
			if(titlePageNo < 1){
				titlePageNo = 1;
			}
			if(contentPageNo < 1){
				contentPageNo = 1;
			}
			
		}catch(Exception e){}
		Page<Information> titlePage = homeService.getTitlePage(titlePageNo, 5);
		Page<Information> contentPage = homeService.getContentPage(contentPageNo, 5);
		Page<Announcement> accouncePage = homeService.getAnnouncePage(accouncePageNo, 5);
		map.put("titlePage", titlePage);
		map.put("contentPage", contentPage);
		map.put("accouncePage", accouncePage);
		return "Home";
	}

}
