package com.example.controller;

import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Announcement;
import com.example.entities.Information;
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
	
	@RequestMapping(value = "/personalManagement")
	public String personal(){
		return "personalManagement";
	}
	
	
	/**
	 * 获取用户信息显示到用户中心模块
	 * @param username
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/userCenter", method = RequestMethod.GET)
	public String getPersonInformation(@PathParam("username") String username, Map<String ,Object> map){
		User user = personInformation.getUserInformation(username);
		map.put("user", user);
		return "userCenter";
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
		return "redirect:/userCenter?username="+user.getUsername();
	}
	
	/**
	 * 分页查询全部提问人为username的问题返回给前台
	 * @param pageNoStr
	 * @param map
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/myAsk")
	public String getProblems(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map, @RequestParam("username") String username){
         int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<Information> page = personInformation.getMyAskPage(pageNo, 5, username);
		map.put("page", page);
		return "myAskPage";
	}
	
	/**
	 * 分页查询全部答疑人为username的问题返回给前台
	 * @param pageNoStr
	 * @param map
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/myAnswer")
	public String getProblemByContent(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map, @RequestParam("username") String username){
         int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<Information> page = personInformation.getMyAnswerPage(pageNo, 5, username);
		map.put("page", page);
		return "myAnswerPage";
	}
	
	/**
	 * 分页查询全部发布人为username的公告返回给前台
	 * @param pageNoStr
	 * @param map
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/myAnnounce")
	public String getAccouncement(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map, @RequestParam("username") String username){
         int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<Announcement> page = personInformation.getMyAnnouncementPage(pageNo, 5, username);
		map.put("page", page);
		return "myAnnouncePage";
	}
	

}
