package com.wangzai.blog.service;

import com.wangzai.blog.model.Admin;

public interface AdminService {
    Admin findByUsername(String username);
}
