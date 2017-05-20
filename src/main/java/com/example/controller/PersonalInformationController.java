package com.example.controller;

import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.User;
import com.example.service.PersonalInformationService;

/**
 * 个人信息模块controller
 * @author wangwang
 *
 */
@Controller
public class PersonalInformationController {
	
	@Autowired
	private PersonalInformationService personInformation;
	
	
	@ModelAttribute
	public void getUser(@RequestParam(value="id",required=false) Integer id,
			Map<String,Object> map){
		if(id!=null){
			User user = personInformation.get(id);
			map.put("user", user);
		}
	}
	
	/**
	 * 通过用户名获取用户信息返还给前端进行回显
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/PersonalInformation",method = RequestMethod.POST)
	public String personalInformation(@PathParam("username") String username, Map<String ,Object> map){
		User user = personInformation.getUserInformation(username);
		map.put("user", user);
		return "personalInformation";
	}
	
	/**
	 * 更新修改后的个人信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "update",method = RequestMethod.PUT)
	public String update(User user){
		personInformation.save(user);
		return "redirect:/main";
	}

}
