package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.entities.User;

/**
 * User与数据库交互
 * @author wangwang
 *
 */
public interface UserRepository extends JpaRepository<User, Integer> {
	
	User getByUsername(String username);

}
