package com.wangzai.blog.dao;

import com.wangzai.blog.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AdminDao extends JpaRepository<Admin, Integer>{

    Admin findByUsername(String username);

    @Override
    <S extends Admin> S save(S s);

    @Override
    void delete(Admin admin);

    @Override
    Optional<Admin> findById(Integer integer);
}
