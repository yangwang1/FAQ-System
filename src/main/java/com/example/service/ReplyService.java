package com.example.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.entities.Information;
import com.example.entities.Reply;
import com.example.repository.InformationRepository;
import com.example.repository.ReplyRepository;

/**
 * 评论模块Service
 * @author wangwang
 *
 */
@Service
public class ReplyService {
	
	@Autowired
	private InformationRepository informationRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	/**
	 * 保存评论
	 * @param id
	 * @param name
	 * @param content
	 */
	@Transactional
	public void save(Integer id, String name, String content){
		Reply reply = new Reply();
		reply.setReplyName(name);
		reply.setContent(content);
		reply.setReplyTime(new Date());
		
		Information information = informationRepository.findOne(id);
		information.getReply().add(reply);
		informationRepository.save(information);
	}
	
	/**
	 * 根据id删除评论
	 * @param id
	 */
	@Transactional
	public void delete(Integer id){
		replyRepository.delete(id);
	}

}
