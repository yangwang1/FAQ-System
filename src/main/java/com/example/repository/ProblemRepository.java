package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.entities.Problem;
/**
 * problem类与数据库交互
 * @author wangwang
 *
 */
public interface ProblemRepository extends JpaRepository<Problem, Integer>{
	
	List<Problem> findByTitleContaining(String title);
}
