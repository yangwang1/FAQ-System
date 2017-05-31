package com.example.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 * FAQ信息实体类
 * @author wangwang
 *
 */
@Entity
public class Information {
	
	private Integer id; //id
	private Problem title; //标题
	private Answer content; //信息内容
	private List<Reply> reply; //回复内容
	
	@GeneratedValue
	@Id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@JoinColumn
	@OneToOne(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY, orphanRemoval = true)
	public Problem getTitle() {
		return title;
	}
	public void setTitle(Problem title) {
		this.title = title;
	}
	@JoinColumn
	@OneToOne(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY, orphanRemoval = true)
	public Answer getContent() {
		return content;
	}
	public void setContent(Answer content) {
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
