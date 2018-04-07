package com.wangzai.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog/user")
public class UserController {

    @GetMapping("userManage")
    public String userManage(){
        return "userManage";
    }
}
