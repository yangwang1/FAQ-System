package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Information;
import com.example.service.QueryService;

@Controller
@RequestMapping(value = "/query")
public class QueryController {
	
	@Autowired
	public QueryService queryService;
	
	/**
	 * 根据关键字查询
	 * @return
	 */
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public String getInformations(@RequestParam(value = "title", required = false) String title, 
			Map<String, Object> map){
		List<Information> informations = queryService.getInformations(title);
		map.put("informations", informations);
		return "queryInformation";
	}

}
