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

import com.example.entities.Information;
import com.example.service.InformationBrowsingService;

/**
 * 信息浏览模块controller
 * @author wangwang
 *
 */
@Controller
@RequestMapping(value = "/information")
public class InformationBrowsingController {
	
	@Autowired
	private InformationBrowsingService informationBrowsingService;
	
	/**
	 * 所有方法执行之前先执行，如果有ID从前台返回，判断为修改操作，从数据库中获取一个information出来
	 * @param id
	 * @param map
	 */
	@ModelAttribute
	private void getInfor(@RequestParam(value = "id", required = false) Integer id, Map<String,Object> map){
		if(id != null){
		  Information information = informationBrowsingService.get(id);
		  map.put("information", information);
		}
	}
	
	@RequestMapping(value = "/create")
	public String createInformation(){
		return "newInformation";
	}
	
	/**
	 * 新建问题的保存
	 * @param information
	 * @return
	 */
	@RequestMapping(value = "/save" ,method = RequestMethod.POST)
	public String save(@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("username") String username){
		informationBrowsingService.save(title, content, username);
		return "redirect:/information/main";
	}
	
	/**
	 * 根据浏览界面中的问题id删除问题
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}" ,method = RequestMethod.GET)
	public String delete(@PathVariable("id") Integer id){
		informationBrowsingService.delete(id);
		return "redirect:/information/main";
	}
	
	/**
	 * 根据问题的id得到详细内容(问题，回答，评论)，然后返回给前台
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "watch/{id}" ,method = RequestMethod.GET)
	public String getDetails(@PathVariable("id") Integer id ,Map<String,Object> map){
		Information information = informationBrowsingService.get(id);
		map.put("information" ,information);
		return "details";
	}
	
	/**
	 * 根据问题的id获取information数据，返回给前台进行回显
	 * @return
	 */
	@RequestMapping(value = "get/{id}", method = RequestMethod.GET)
	public String getInformation(@PathVariable("id") Integer id, Map<String,Object> map){
		Information information = informationBrowsingService.get(id);
		map.put("information" ,information);
		return "updateInformation";
	}
	
	/**
	 * 修改后保存数据
	 * @param information
	 * @return
	 */
	@RequestMapping(value = "save/{id}", method = RequestMethod.PUT)
	public String update(Information information, @PathVariable("id") Integer id){
		informationBrowsingService.update(information);
		return "redirect:/information/watch/" + id;
	}
	
	/**
	 * 分页,把后台取得的所有信息分页返回给前端页面
	 * @param pageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping("/main")
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
		
		Page<Information> page = informationBrowsingService.getPage(pageNo, 5);
		map.put("page", page);
		return "main";
	}
	
}
