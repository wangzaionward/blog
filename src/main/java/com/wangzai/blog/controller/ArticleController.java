package com.wangzai.blog.controller;

import com.wangzai.blog.Exception.SystemException;
import com.wangzai.blog.constant.SystemUser;
import com.wangzai.blog.model.Article;
import com.wangzai.blog.model.Category;
import com.wangzai.blog.model.User;
import com.wangzai.blog.service.ArticleService;
import com.wangzai.blog.service.CategoryService;
import com.wangzai.blog.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/blog/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping(value = "query/{categoryId}")
    public ModelAndView query(@PathVariable @NotNull Integer categoryId){
        ModelAndView modelAndView = new ModelAndView("index");
        List<Article> articleList = articleService.findAllByCategoryId(categoryId);
        if(null == articleList || articleList.size() <= 0) return modelAndView;
        List<Article> articleList2 = articleList.stream().sorted(Comparator.comparing(Article::getCreateTime).reversed()).collect(Collectors.toList());
        List<Article> articleList3 = articleList.stream().sorted(Comparator.comparing(Article::getHits).reversed()).collect(Collectors.toList());
        List<Article> articleList4 = articleList.stream().sorted(Comparator.comparing(Article::getLike).reversed()).collect(Collectors.toList());
        List<Article> articleList5 = articleList.stream().sorted(Comparator.comparing(Article::getComments).reversed()).collect(Collectors.toList());
        modelAndView.addObject("articleList2", articleList2);
        modelAndView.addObject("articleList2", articleList3);
        modelAndView.addObject("articleList2", articleList4);
        modelAndView.addObject("articleList2", articleList5);
        List<Category> categoryList = categoryService.findByUserId(SystemUser.SYSTEM_USER_ID);
        modelAndView.addObject("categoryList", categoryList);
        return modelAndView;
    }

    /**
     * 根据id查询文章详情
     * @param id
     * @return
     */
    @GetMapping(value = "detail/{id}")
    public ModelAndView detail(@PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("article");
        Article article = articleService.findOne(id);
        if(null == article) throw new SystemException("文章不存在");
        modelAndView.addObject("article", article);
        return modelAndView;
    }

    @GetMapping("articleManage")
    public String articleManage(Map<String, Object> map, HttpSession session){
        User user = UserUtil.getCurrentUser(session);
        List<Category> categoryList = categoryService.findByUserId(user.getId());
        List<Article> articleList = articleService.findAll();
        map.put("categoryList", categoryList);
        map.put("articleList", articleList);
        return "articleManage";
    }

    /**
     * 新建文章分类
     * @param categoryName
     * @return
     */
    @PostMapping("createCategory")
    @ResponseBody
    public boolean createCategory(@NotBlank String categoryName, HttpSession session){
        User user = UserUtil.getCurrentUser(session);
        Category category = new Category(categoryName, user.getId());
        categoryService.save(category);
        return true;
    }

    @PostMapping("createArticle")
    @ResponseBody
    public boolean createArticle(@NotBlank String title, @NotBlank String description, @NotBlank String content, @NotNull Integer categoryId, HttpSession session){
        User user = UserUtil.getCurrentUser(session);
        Article article = new Article();
        article.setTitle(title);
        article.setDescription(description);
        article.setContent(content);
        article.setAuthor(user.getUsername());
        article.setUserId(user.getId());
        article.setCreateTime(new Date());
        article.setUpdateTime(new Date());
        article.setCategoryId(categoryId);
        articleService.save(article);
        return true;
    }

}
