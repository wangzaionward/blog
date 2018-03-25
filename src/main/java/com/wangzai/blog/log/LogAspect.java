package com.wangzai.blog.log;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Aspect
@Component
public class LogAspect {

    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

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

}
