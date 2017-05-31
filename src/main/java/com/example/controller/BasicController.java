package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasicController {
	
	
	@RequestMapping("/system")
	public String system(){
		return "system";
	}
	
	@RequestMapping("/success")
	public String success(){
		return "success";
	}
	
	@RequestMapping("/queryPage")
	public String queryPage(){
		return "queryPage";
	}
	
	
	@RequestMapping("/DenyAccess")
	public String DenyAccess(){
		return "DenyAccess";
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
