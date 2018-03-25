package com.wangzai.blog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.annotation.PostConstruct;

@Configuration
public class FreemarkerConfig {

    @Autowired
    protected freemarker.template.Configuration configuration;

    @Autowired
    protected FreeMarkerViewResolver freemarkerResolver;

    @Autowired
    protected InternalResourceViewResolver springResolver;

    @PostConstruct
    public void setSharedVariable(){
        freemarkerResolver.setSuffix(".ftl");
        freemarkerResolver.setCache(false);
        freemarkerResolver.setRequestContextAttribute("request"); //为模板调用时，调用request对象的变量名
        freemarkerResolver.setOrder(0);
        freemarkerResolver.setExposeRequestAttributes(true);
        freemarkerResolver.setExposeSessionAttributes(true);
    }

}
