package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Announcement;
/**
 * 发布公告模块与持久层交互
 * @author wangwang
 *
 */
public interface AnnouncementRepository extends JpaRepository<Announcement, Integer>{

}
