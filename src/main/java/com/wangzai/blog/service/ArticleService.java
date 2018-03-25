package com.wangzai.blog.service;

import com.wangzai.blog.model.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ArticleService {

    /**
     * 根据文章分类id查询所有文章
     * @param categoryId
     * @return
     */
    List<Article> findAllByCategoryId(Integer categoryId);

    /**
     * 根据文章分类id分页查询所有文章
     * @param categoryId
     * @return
     */
    Page<Article> findByCategoryId(Integer categoryId, Pageable pageable);

    List<Article> findAll();

    Article getOne(Integer articleId);

}
