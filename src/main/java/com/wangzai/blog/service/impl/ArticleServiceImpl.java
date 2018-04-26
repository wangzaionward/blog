package com.wangzai.blog.service.impl;

import com.wangzai.blog.dao.ArticleDao;
import com.wangzai.blog.model.Article;
import com.wangzai.blog.service.ArticleService;
import com.wangzai.blog.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Override
    public List<Article> findAllByCategoryId(Integer categoryId) {
        return articleDao.findAllByCategoryId(categoryId);
    }

    @Override
    public List<Article> findByCategoryIdPageable(Integer categoryId, Integer pageNum, Integer pageSize) {
        return articleDao.findAllByCategoryId(categoryId);
    }

    @Override
    public List<Article> findAll() {
        return articleDao.findAll();
    }

    @Override
    public Article findOne(Integer articleId) {
        Optional<Article> article = articleDao.findById(articleId);
        if(article.isPresent()) return article.get();
        return null;
    }

    @Override
    public Article save(Article article) {
        return articleDao.save(article);
    }

    @Override
    public Page<Article> query(Article article, Integer pageNum, Integer pageSize){
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize, Sort.by("createTime"));
        if(null == article) return articleDao.findAll(pageable);
        Specification<Article> specification = new Specification<Article>() {
            @Override
            public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList<>();
                if(!StringUtil.isBlank(article.getTitle()))
                    list.add(criteriaBuilder.like(root.get("title").as(String.class), "%" + article.getTitle() + "%"));

                if(!StringUtil.isBlank(article.getDescription()))
                    list.add(criteriaBuilder.like(root.get("description").as(String.class), "%" + article.getDescription() + "%"));

                if(!StringUtil.isBlank(article.getContent()))
                    list.add(criteriaBuilder.like(root.get("content").as(String.class), "%" + article.getContent() + "%"));

                if(null != article.getUserId())
                    list.add(criteriaBuilder.equal(root.get("userId").as(Integer.class), article.getUserId()));

                if(null != article.getCategoryId())
                    list.add(criteriaBuilder.equal(root.get("categoryId").as(Integer.class), article.getCategoryId()));

                if(!StringUtil.isBlank(article.getAuthor()))
                    list.add(criteriaBuilder.like(root.get("author").as(String.class), "%" + article.getAuthor() + "%"));

                if(!StringUtil.isBlank(article.getCategoryName()))
                    list.add(criteriaBuilder.like(root.get("categoryName").as(String.class), "%" + article.getCategoryName() + "%"));

                if(null != article.getType())
                    list.add(criteriaBuilder.equal(root.get("type").as(Integer.class), article.getType()));

                Predicate[] p = new Predicate[list.size()];
                return criteriaBuilder.and(list.toArray(p));
            }
        };
        Page<Article> articlePage = articleDao.findAll(specification, pageable);
        return articlePage;
    }
}
