package com.wangzai.blog.controller;

import com.wangzai.blog.model.Article;
import com.wangzai.blog.model.Category;
import com.wangzai.blog.model.User;
import com.wangzai.blog.service.ArticleService;
import com.wangzai.blog.service.CategoryService;
import com.wangzai.blog.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("index")
    public String index(Map<String, Object> map){
        List<Category> categoryList = categoryService.findByUserId(0);
        List<Article> articleList = articleService.findAll();
        map.put("categoryList", categoryList);
        map.put("articleList", articleList);
        return "index";
    }

    @GetMapping("findAllByCategoryId")
    public String findAllByCategoryId(Map<String, Object> map, @NotBlank Integer categoryId){
        List<Category> categoryList = categoryService.findAll();
        List<Article> articleList = articleService.findAllByCategoryId(categoryId);
        map.put("categoryList", categoryList);
        map.put("articleList", articleList);
        return "index";
    }

}
