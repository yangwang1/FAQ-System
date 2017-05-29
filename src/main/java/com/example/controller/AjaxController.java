package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Information;
import com.example.service.AjaxService;

/**
 * 用于ajax请求的controller
 * @author wangwang
 *
 */
@Controller
public class AjaxController {
	
	@Autowired
	private AjaxService ajaxService;

	@RequestMapping(value = "/getTitle", method = RequestMethod.POST)
	public String getTitle(@RequestParam("title") String title, Map<String, Object> map){
		List<Information> informations = ajaxService.getTitles(title);
		map.put("informations", informations);
		map.put("title", title);
		return "queryPage";
	}
}
