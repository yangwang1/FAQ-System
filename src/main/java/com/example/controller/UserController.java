package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.User;
import com.example.service.UserService;

/**
 * 后台管理模块controller
 * @author wangwang
 *
 */
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute
	public void getUser(@RequestParam(value="id",required=false) Integer id,
			Map<String,Object> map){
		if(id!=null){
			User user = userService.get(id);
			map.put("user", user);
		}
	}
	
	/**
	 * 通过id删除对应的user
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String delete(@PathVariable("id") Integer id){
		userService.delete(id);
		return "redirect:/back";
	}
	
	/**
	 * 根据id获取user返还给前台进行回显
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String input(@PathVariable("id") Integer id, Map<String, Object> map){
		User user = userService.get(id);
		map.put("user", user);
		return "input";
	}
	
	/**
	 * 修改的保存
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/save/{id}",method = RequestMethod.PUT)
	public String update(User user){
		userService.save(user);
		return "redirect:/back";
	}
	
	/**
	 * 保存
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/save",method = RequestMethod.POST)
	public String save(User user){
		userService.save(user);
		return "redirect:/back";
	}
	
	/**
	 * 分页
	 * @param pageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping("/back")
	public String list(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map){
		int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<User> page = userService.getPage(pageNo, 10);
		map.put("page", page);
		return "back";
	}
}
