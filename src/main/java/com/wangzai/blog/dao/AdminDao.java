package com.wangzai.blog.dao;

import com.wangzai.blog.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao extends JpaRepository<Admin, Integer>{

    Admin findByUsername(String username);

}
