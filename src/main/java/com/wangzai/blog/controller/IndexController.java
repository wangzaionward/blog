package com.wangzai.blog.controller;

import com.wangzai.blog.model.Article;
import com.wangzai.blog.model.Category;
import com.wangzai.blog.service.ArticleService;
import com.wangzai.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.wangzai.blog.constant.SystemUser.SYSTEM_USER_ID;

/**
 * 首页
 */
@Controller
@RequestMapping("/blog")
public class IndexController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("index")
    public ModelAndView index(){
        return query(null);
    }

    @GetMapping("query/{categoryId}")
    public ModelAndView query(@PathVariable Integer categoryId){
        ModelAndView modelAndView = new ModelAndView("index");
        List<Category> categoryList = categoryService.findByUserId(SYSTEM_USER_ID);
        if(null == categoryList || categoryList.size() <= 0) return modelAndView;
        Article article = new Article();
        article.setCategoryId(categoryId);
        List<Article> articleList = articleService.query(article);
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("articleList", articleList);
        modelAndView.addObject("categoryId", categoryId);
        return modelAndView;
    }

}
