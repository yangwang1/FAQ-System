package com.example.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/**
 * FAQ信息实体类
 * @author wangwang
 *
 */
@Entity
public class Information {
	
	private Integer id; //id
	private String content; //信息内容
	private List<Reply> reply; //回复内容
	
	@GeneratedValue
	@Id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@JoinColumn
	@OneToMany(orphanRemoval=true)
	public List<Reply> getReply() {
		return reply;
	}
	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}

}
