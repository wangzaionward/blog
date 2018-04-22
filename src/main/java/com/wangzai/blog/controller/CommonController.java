package com.wangzai.blog.controller;

import com.wangzai.blog.constant.CurrentUser;
import com.wangzai.blog.model.User;
import com.wangzai.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;

/**
 * 登录 注册
 */
@Controller
@RequestMapping("/blog")
public class CommonController {

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

}
