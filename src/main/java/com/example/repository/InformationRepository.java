package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.example.entities.Information;
import com.example.entities.Problem;

/**
 * information与数据库交互
 * @author wangwang
 *
 */
public interface InformationRepository extends JpaRepository<Information, Integer>, 
JpaSpecificationExecutor<Information>{
	
	Information findByTitle(Problem title);
	
}
