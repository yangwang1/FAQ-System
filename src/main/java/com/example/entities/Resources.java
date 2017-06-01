package com.example.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 资源实体类
 * @author wangwang
 *
 */
@Entity
public class Resources {

	private Integer id; //资源id
	private String name;  //资源名
	private String src;  //资源链接
	
	@GeneratedValue
	@Id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	@Override
	public String toString() {
		return "Resources [id=" + id + ", name=" + name + ", src=" + src + "]";
	}
}
