package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Resources;

/**
 * 资源与数据库交互
 * @author wangwang
 *
 */
public interface ResourcesRepository extends JpaRepository<Resources, Integer>{

}
