package com.wangzai.blog.service.impl;

import com.wangzai.blog.dao.AdminDao;
import com.wangzai.blog.model.Admin;
import com.wangzai.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findByUsername(String username) {
        return adminDao.findByUsername(username);
    }

}
