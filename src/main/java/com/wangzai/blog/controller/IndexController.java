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
        return article(null, PageHelper.PAGE_NUM_DEFAULT);
    }

    @GetMapping("/article")
    public ModelAndView article(@RequestParam Integer categoryId, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum){
        return myArticle(categoryId, pageNum, null);
    }

    @GetMapping("/myArticle")
    public ModelAndView myArticle(@RequestParam Integer categoryId, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam Integer userId){

        String viewName;
        Article article;
        if(null == userId){//首页 所有文章
            article = new Article(categoryId);
            viewName = "index";
        }else{//我的文章
            article = new Article(userId, categoryId);
            viewName = "article";
        }

        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("categoryId", categoryId);
        List<Category> categories = categoryService.findByUserId(SYSTEM_USER_ID);
        if(null == categories || categories.size() <= 0) return modelAndView;
        modelAndView.addObject("categories", categories);

        Page<Article> pageInfo = articleService.query(article, pageNum, PageHelper.PAGE_SIZE_DEFAULT);
        List<Article> articles = pageInfo.getContent();
        if(null == articles || articles.size() <= 0) return modelAndView;
        modelAndView.addObject("articles", articles);
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

}
