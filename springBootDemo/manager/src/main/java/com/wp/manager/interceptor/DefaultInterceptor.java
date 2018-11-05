package com.wp.manager.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.wp.manager.core.constants.GlobalConstants.USER_SESSION_ID;

/**
 * @author wp
 * @since 2018/9/10 18:33
 */
@Component
public class DefaultInterceptor extends HandlerInterceptorAdapter implements ServletContextAware {
    //一般情况下，对来自浏览器的请求的拦截，是利用Filter实现的,而在Spring中，基于Filter这种方式可以实现Bean预处理
    //Spring MVC提供的HandlerInterceptorAdapter这个适配器，继承此类，可以非常方便的实现自己的拦截器。

    //实现ServletContextAware 获取servlet进行初始化配置

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final String CONTEXT_PATH = "ctx";

    @Override
    public void setServletContext(ServletContext servletContext) {
        logger.error("manager started!");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute(CONTEXT_PATH, request.getContextPath());

        String user = (String)request.getSession().getAttribute(USER_SESSION_ID);
        if(user == null) {
            return true;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView == null) {
            return;
        }
    }
}
