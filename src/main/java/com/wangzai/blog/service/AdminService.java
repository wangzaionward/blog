package com.wangzai.blog.service;

import com.wangzai.blog.model.Admin;

public interface AdminService {
    Admin findByUsername(String username);

    <S extends Admin> S save(S s);

    void delete(Admin admin);

    Admin findById(Integer integer);
}
