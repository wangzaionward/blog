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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/blog/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 根据id查询文章详情
     * @param map
     * @param articleId
     * @return
     */
    @GetMapping("detail")
    public String detail(Map<String, Object> map, @NotNull Integer articleId){
        map.put("article", articleService.getOne(articleId));
        return "article";
    }

    @GetMapping("articleManage")
    public String articleManage(Map<String, Object> map, HttpSession session){
        User user = UserUtil.getCurrentUser(session);
        if(null == user) return "login";
        List<Category> categoryList = categoryService.findByUserId(user.getId());
        map.put("categoryList", categoryList);
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
