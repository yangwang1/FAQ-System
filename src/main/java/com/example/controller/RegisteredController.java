package com.example.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.entities.User;
import com.example.service.RegisteredService;

/**
 * 注册
 * @author wangwang
 *
 */
@Controller
public class RegisteredController {
	
	@Autowired
	private RegisteredService registeredService;
	
	@ResponseBody
	@RequestMapping(value="/ajaxValidateLastName", method=RequestMethod.POST)
	public String validateUsername(@RequestParam(value="username",required=true) String username){
		User user = registeredService.getByUsername(username);
		if(user == null){
			return "0";
		}else{
			return "1";
		}
	}
	
	@RequestMapping(value = "/register")
	public String register(){
		
		return "register";
	}
	
	@RequestMapping(value = "/registered",method = RequestMethod.POST)
	public String registered(@RequestParam("username") String username,@RequestParam(value = "password", required = true) String password,
			@RequestParam("con_password") String con_password, @RequestParam(value = "mailbox", required = false) String mailbox, @RequestParam(value = "birth", required = false) Date birth){
		
		registeredService.registered(username, password , mailbox, birth);
		
		return "registeredSuccess";
	}

}
