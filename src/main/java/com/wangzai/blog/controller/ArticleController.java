package com.wangzai.blog.controller;

import com.wangzai.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.constraints.NotBlank;
import java.util.Map;

@Controller
@RequestMapping("/blog/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    /**
     * 根据id查询文章详情
     * @param map
     * @param articleId
     * @return
     */
    @GetMapping("detail")
    public String detail(Map<String, Object> map, @NotBlank Integer articleId){
        map.put("article", articleService.getOne(articleId));
        return "article";
    }

}
