package com.example.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 公告实体类
 * @author wangwang
 *
 */
@Entity
public class Announcement {

	private Integer id;  //id
	private String title;  //公告标题
	private String content; //公告内容
	private String username; //发布人
	private Date creatTime;  //创建时间
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	@Override
	public String toString() {
		return "Announcement [id=" + id + ", title=" + title + ", content=" + content + ", username=" + username
				+ ", creatTime=" + creatTime + "]";
	}	
}
