package com.wangzai.blog.controller;

import com.wangzai.blog.constant.CurrentUser;
import com.wangzai.blog.constant.SystemUser;
import com.wangzai.blog.model.Article;
import com.wangzai.blog.model.Category;
import com.wangzai.blog.model.User;
import com.wangzai.blog.service.ArticleService;
import com.wangzai.blog.service.CategoryService;
import com.wangzai.blog.service.UserService;
import com.wangzai.blog.utils.DateUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 首页 登录 注册页面Controller
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    /**
     * 登录界面
     * @return
     */
    @GetMapping("login")
    public String login(){
        return "login";
    }

    /**
     * 登录
     * @param username
     * @param password
     * @param session
     * @return
     */
    @PostMapping("loginSubmit")
    @ResponseBody
    public boolean loginSubmit(@NotBlank String username, @NotBlank String password, HttpSession session){
        User user = userService.login(username, password);
        if(null == user) return false;
        session.setAttribute(CurrentUser.CURRENT_USER, user);
        return true;
    }

    /**
     * 退出
     * @param session
     * @return
     */
    @GetMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute(CurrentUser.CURRENT_USER);
        return "login";
    }

    /**
     * 注册界面
     * @return
     */
    @GetMapping("register")
    public String register(){
        return "register";
    }

    /**
     * 注册
     * @param username
     * @param password
     * @return
     */
    @PostMapping("registerSubmit")
    @ResponseBody
    public boolean registerSubmit(@NotBlank String username, @NotBlank String password){
        if(userService.register(username, password))
            return true;
        return false;
    }

    @GetMapping("index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("index");
        List<Category> categoryList = categoryService.findByUserId(SystemUser.SYSTEM_USER_ID);
        List<Article> articleList = articleService.findAll();
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("articleList", articleList);
        return modelAndView;
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
