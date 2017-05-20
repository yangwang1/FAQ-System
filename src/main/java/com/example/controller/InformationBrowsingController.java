package com.example.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entities.Information;
import com.example.entities.User;
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
	public String save(Information information){
		informationBrowsingService.save(information);
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
		
		Page<Information> page = informationBrowsingService.getPage(pageNo, 10);
		map.put("page", page);
		return "main";
	}
	
}
