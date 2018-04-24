package com.wangzai.blog.controller;

import com.wangzai.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog/user")
public class UserController {

    @Autowired
    private AdminService adminService;

    @GetMapping("userManage")
    @Transactional(rollbackFor = RuntimeException.class)
    public String userManage(){
        return "userManage";
    }


}
