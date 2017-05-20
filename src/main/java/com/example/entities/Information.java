package com.example.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
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
	private String title; //标题
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@JoinColumn
	@OneToMany(orphanRemoval=true, cascade = {CascadeType.ALL})
	public List<Reply> getReply() {
		return reply;
	}
	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "Information [id=" + id + ", title=" + title + ", content=" + content + ", reply=" + reply + "]";
	}

}
