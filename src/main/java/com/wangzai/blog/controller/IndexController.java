package com.wangzai.blog.controller;

import com.wangzai.blog.constant.PageHelper;
import com.wangzai.blog.model.Article;
import com.wangzai.blog.model.Category;
import com.wangzai.blog.service.ArticleService;
import com.wangzai.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
        return query(null, PageHelper.PAGE_NUM_DEFAULT);
    }

    @GetMapping("article/{categoryId}")
    public ModelAndView query(@PathVariable Integer categoryId, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum){
        ModelAndView modelAndView = new ModelAndView("index");
        List<Category> categoryList = categoryService.findByUserId(SYSTEM_USER_ID);
        if(null == categoryList || categoryList.size() <= 0) return modelAndView;
        modelAndView.addObject("categoryList", categoryList);
        Article article = new Article();
        article.setCategoryId(categoryId);
        Page<Article> articlePage = articleService.query(article, pageNum, PageHelper.PAGE_SIZE_DEFAULT);
        List<Article> articleList = articlePage.getContent();
        if(null == articleList || articleList.size() <= 0) return modelAndView;
        modelAndView.addObject("articleList", articleList);
        return modelAndView;
    }

}
