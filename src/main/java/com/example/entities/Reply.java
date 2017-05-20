package com.example.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 答疑评论实体类
 * @author wangwang
 *
 */
@Entity
public class Reply {
	
	private Integer id; //id
	private String content;  //评论内容
	private String replyName; //回复人
	private Date replyTime; //回复时间
	
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
	public String getReplyName() {
		return replyName;
	}
	public void setReplyName(String replyName) {
		this.replyName = replyName;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	
	@Override
	public String toString() {
		return "Reply [id=" + id + ", content=" + content + ", replyName=" + replyName + ", replyTime=" + replyTime
				+ "]";
	}

}
