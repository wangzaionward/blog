package com.wangzai.blog.service.impl;

import com.wangzai.blog.dao.ArticleDao;
import com.wangzai.blog.model.Article;
import com.wangzai.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public List<Article> findAllByCategoryId(Integer categoryId) {
        return articleDao.findAllByCategoryId(categoryId);
    }

    @Override
    public Page<Article> findByCategoryId(Integer categoryId, Pageable pageable) {
        return articleDao.findByCategoryId(categoryId, pageable);
    }

    @Override
    public List<Article> findAll() {
        return articleDao.findAll();
    }

    @Override
    public Article getOne(Integer articleId) {
        return articleDao.getOne(articleId);
    }

    @Override
    public Article save(Article article) {
        return articleDao.save(article);
    }
}
