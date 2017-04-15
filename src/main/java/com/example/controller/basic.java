package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class basic {
	
	@RequestMapping("/main")
	public String main(){
		return "main";
	}
	
	@RequestMapping("/back")
	public String back(){
		return "back";
	}
	
	@RequestMapping("/VIP")
	public String vip(){
		return "VIP";
	}
	
	@RequestMapping("/DenyAccess")
	public String DenyAccess(){
		return "DenyAccess";
	}
	
	@RequestMapping("/helloworld")
	public String hello(){
		System.out.println("hello world");
		return "success";
	}
	
	@RequestMapping("/session")
	public String session(){
		return "session";
	}
	
	@RequestMapping("/failure")
	public String failure(){
		return "failure";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}

}
