package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Answer;

/**
 * Answer类与数据库交互
 * @author wangwang
 *
 */
public interface AnswerRepository extends JpaRepository<Answer, Integer>{

}
