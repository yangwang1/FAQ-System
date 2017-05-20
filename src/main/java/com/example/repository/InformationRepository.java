package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.example.entities.Information;

/**
 * information与数据库交互
 * @author wangwang
 *
 */
public interface InformationRepository extends JpaRepository<Information, Integer>, 
JpaSpecificationExecutor<Information>{
	
	List<Information> findByTitleContaining(String title);
	
}
