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
    List<Article> findByCategoryIdPageable(Integer categoryId, Integer pageNum, Integer pageSize);

    List<Article> findAll();

    Article findOne(Integer articleId);

    Article save(Article article);

    Page<Article> query(Article article, Integer pageNum, Integer pageSize);


}
