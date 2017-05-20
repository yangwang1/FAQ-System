package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/**
	 * 根据评论id删除评论，接收问题id用于重定向回界面
	 * @param replyId
	 * @param informationId
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Integer replyId, @RequestParam("id") Integer informationId){
		replyService.delete(replyId);
		return "redirect:/information/watch/" + informationId;
	}
}
