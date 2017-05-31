package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	 * 学生提问的保存
	 * @param title
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/question", method = RequestMethod.POST)
	public String question(@RequestParam("title") String title, @RequestParam("username") String username){
		askService.save(title, username);
		return "askSuccessPage";
	}
}
