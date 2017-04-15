package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.entities.UserRole;

/**
 * UserRole与数据库交互
 * @author wangwang
 *
 */
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

}
