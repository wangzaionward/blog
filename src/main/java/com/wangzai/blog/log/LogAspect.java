package com.wangzai.blog.log;

import com.wangzai.blog.Exception.SystemException;
import com.wangzai.blog.constant.ErrorPage;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Aspect//切面
@Component//注册到spring容器
public class LogAspect {

    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    //切点
    @Pointcut("execution(public * com.wangzai.blog.controller.*.*(..))")
    public void pointCut(){}

    @Before("pointCut()")
    public void doBefore(JoinPoint joinPoint){
        ServletRequestAttributes attributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        logger.info("=================请求内容==================");
        logger.info("请求地址:" + request.getRequestURL().toString());
        logger.info("IP:" + request.getRemoteAddr());
        logger.info("请求方法:" + joinPoint.getSignature());
        logger.info("参数:" + Arrays.toString(joinPoint.getArgs()));
        logger.info("=================请求内容==================");
    }

    @AfterReturning(returning = "ret", pointcut = "pointCut()")
    public void doAfterReturning(Object ret){
        logger.info("=================返回内容==================");
        logger.info("return:" + ret);
        logger.info("=================返回内容==================");
    }

    @AfterThrowing(throwing = "e", pointcut = "pointCut()")
    public ModelAndView doAfterThrowing(Throwable e){
        ModelAndView modelAndView = new ModelAndView();
        ServletRequestAttributes attributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        if(e instanceof SystemException){
            logger.info("500 : " + request.getRequestURL());
            modelAndView.setViewName(ErrorPage.SYSTEM_ERROR);
            return modelAndView;
        }else {
            logger.info("404 : " + request.getRequestURL());
            modelAndView.setViewName(ErrorPage.NOT_FOUND);
            return modelAndView;
        }
    }

}
