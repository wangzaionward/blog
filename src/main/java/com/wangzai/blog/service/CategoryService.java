package com.wangzai.blog.service;

import com.wangzai.blog.model.Category;

import java.util.List;

public interface CategoryService {

    /**
     * 查询所有分类
     * @return
     */
    List<Category> findAll();

    List<Category> findByUserId(Integer userId);

    Category save(Category category);

    void delete(Category category);
}
