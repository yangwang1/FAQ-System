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
import com.example.service.AnswerService;
import com.example.service.InformationBrowsingService;

/**
 * 教师答疑模块Controller
 * @author wangwang
 *
 */
@RequestMapping(value = "/answer")
@Controller
public class AnswerController {

	@Autowired
	private AnswerService answerService;
	
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
	/**
	 * 根据浏览界面中的问题id删除问题
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Integer id){
		informationBrowsingService.delete(id);
		return "redirect:/answer/answer";
	}
	
	/**
	 * 根据id获取信息进行回显
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "answerQuestion/{id}")
	public String askQuestion(@PathVariable("id") Integer id, Map<String, Object> map){
		Information information = answerService.getInformation(id);
		map.put("information", information);
		return "answerQuestionPage";
	}
	
	/**
	 * 回答问题的保存
	 * @param information
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "save/{id}", method = RequestMethod.POST)
	public String save(Information information, @RequestParam("username") String username){
		answerService.save(information, username);
		return "answerSuccessPage";
	}
	
	/**
	 * 带查询条件的分页
	 * @param pageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/answer")
	public String getProblems(@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map){
         int pageNo = 1;
		
		try{
			//对pageNo的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		}catch(Exception e){}
		
		Page<Information> page = answerService.getPage(pageNo, 5);
		map.put("page", page);
		return "answerPage";
	}
}
