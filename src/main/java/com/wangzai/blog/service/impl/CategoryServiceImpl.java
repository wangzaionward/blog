package com.wangzai.blog.service.impl;

import com.wangzai.blog.dao.CategoryDao;
import com.wangzai.blog.model.Category;
import com.wangzai.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }
}
