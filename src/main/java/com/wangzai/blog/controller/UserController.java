package com.wangzai.blog.controller;

import com.wangzai.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class UserController {

    @Autowired
    private AdminService adminService;

    @GetMapping("user")
    @Transactional(rollbackFor = RuntimeException.class)
    public String user(){
        return "user";
    }


}
