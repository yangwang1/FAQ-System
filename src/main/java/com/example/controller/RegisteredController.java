package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/register")
	public String register(){
		
		return "register";
	}
	
	@RequestMapping(value = "/registered",method = RequestMethod.POST)
	public String registered(@RequestParam("username") String username,@RequestParam("password") String password,
			@RequestParam("con_password") String con_password){
		
		registeredService.registered(username, password);
		
		return "registeredSuccess";
	}

}
