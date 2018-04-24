package com.wangzai.blog.service.impl;

import com.wangzai.blog.dao.AdminDao;
import com.wangzai.blog.model.Admin;
import com.wangzai.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service("adminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findByUsername(String username) {
        return adminDao.findByUsername(username);
    }

    @Override
    public <S extends Admin> S save(S s) {
        return adminDao.save(s);
    }

    @Override
    public void delete(Admin admin) {
        adminDao.delete(admin);
    }

    @Override
    public Admin findById(Integer integer) {
        return adminDao.findById(integer).orElse(null);
    }
}
