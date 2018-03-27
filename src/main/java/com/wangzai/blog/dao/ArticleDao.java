package com.wangzai.blog.dao;

import com.wangzai.blog.model.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao extends JpaRepository<Article, Integer> {

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

    Article save(Article article);
}
