package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Information;
import com.example.entities.User;
import com.example.service.InformationBrowsingService;

/**
 * 信息浏览模块controller
 * @author wangwang
 *
 */
@Controller
@RequestMapping(value = "/information")
public class InformationBrowsingController {
	
	@Autowired
	private InformationBrowsingService informationBrowsingService;
	
	/**
	 * 分页,把后台取得的所有信息分页返回给前端页面
	 * @param pageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping("/main")
	public String list(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map){
		int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<Information> page = informationBrowsingService.getPage(pageNo, 10);
		map.put("page", page);
		return "main";
	}
	
}
