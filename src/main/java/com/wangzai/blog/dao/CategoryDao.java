package com.wangzai.blog.dao;

import com.wangzai.blog.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryDao extends JpaRepository<Category, Integer>{

    /**
     * 查询用户所有文章分类
     * @return
     */
    List<Category> findByUserId(Integer userId);

    Category save(Category category);

    void delete(Category category);
}
