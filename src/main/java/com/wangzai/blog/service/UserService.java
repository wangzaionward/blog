package com.wangzai.blog.service;

import com.wangzai.blog.model.User;

public interface UserService {

    User login(String username, String password);

    boolean register(String username, String password);

}
