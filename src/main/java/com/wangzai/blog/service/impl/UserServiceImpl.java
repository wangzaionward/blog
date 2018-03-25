package com.wangzai.blog.service.impl;

import com.wangzai.blog.dao.UserDao;
import com.wangzai.blog.model.User;
import com.wangzai.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String username, String password) {
        return userDao.findUserByUsernameAndPassword(username, password);
    }

    @Override
    public boolean register(String username, String password) {
        User user = userDao.findByUsername(username);
        if(null != user) return false;
        User user2 = new User();
        user2.setUsername(username);
        user2.setPassword(password);
        user2.setCreateTime(new Date());
        user2.setUpdateTime(new Date());
        userDao.save(user2);
        return true;
    }
}
