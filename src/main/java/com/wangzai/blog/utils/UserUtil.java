package com.wangzai.blog.utils;

import com.wangzai.blog.model.User;

import javax.servlet.http.HttpSession;

public class UserUtil {

    public static User getCurrentUser(HttpSession session){
        User user = (User)session.getAttribute("user");
        return user;
    }

}
