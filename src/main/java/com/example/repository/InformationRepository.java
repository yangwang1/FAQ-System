package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Information;

/**
 * information与数据库交互
 * @author wangwang
 *
 */
public interface InformationRepository extends JpaRepository<Information, Integer> {

}
