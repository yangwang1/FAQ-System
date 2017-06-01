package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Information;
import com.example.entities.Resources;
import com.example.service.ResourcesService;

/**
 * 资源service
 * @author wangwang
 *
 */
@Controller
public class ResourcesController {
	
	@Autowired
	private ResourcesService resourcesService;

	@RequestMapping("/resources")
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
		
		Page<Resources> page = resourcesService.getPage(pageNo, 5);
		map.put("page", page);
		return "resources";
	}
}
