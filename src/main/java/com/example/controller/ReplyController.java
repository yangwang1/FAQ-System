package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Reply;
import com.example.service.ReplyService;

/**
 * 答疑评论模块Controller
 * @author wangwang
 *
 */
@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	/**
	 * 发表评论
	 * @param id
	 * @param name
	 * @param content
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@RequestParam("id") Integer id, @RequestParam("replyName") String name, 
			@RequestParam("content") String content){
		replyService.save(id, name, content);
		return "redirect:/information/watch/" + id;
	}
}
