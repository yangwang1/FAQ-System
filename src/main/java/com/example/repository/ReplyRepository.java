package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Reply;

/**
 * reply与数据库交互
 * @author wangwang
 *
 */
public interface ReplyRepository extends JpaRepository<Reply, Integer>{

}
