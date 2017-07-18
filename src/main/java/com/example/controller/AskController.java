package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Announcement;
import com.example.entities.Information;
import com.example.service.AskService;

/**
 * 学生提问模块Controller
 * @author wangwang
 *
 */
@RequestMapping(value = "/ask")
@Controller
public class AskController {
	
	@Autowired
	private AskService askService;

	@RequestMapping(value = "/ask")
	public String ask(){
		return "askPage";
	}
	
	/**
	 * 分页查询全部标题包含输入内容的问题
	 * @param pageNoStr
	 * @param map
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String getInformations(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map, @RequestParam(value = "title") String title, 
			@RequestParam(value = "username", required=false) String username){
        int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<Information> page = askService.getInformations(pageNo, 5, title);
		
		if(username != null){
			askService.save(title, username);
		}
		map.put("page", page);
		map.put("title", title);
		return "askSuccessPage";
	}
}
