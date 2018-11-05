package com.wp.manager.config;

import com.google.code.kaptcha.servlet.KaptchaServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 添加验证码配置
 * @author wp
 * @since 2018/9/11 14:53
 */
@Configuration
public class ServletConfig {

    //ServletRegistrationBean  注册自定义servlet
    @Bean
    public ServletRegistrationBean kaptchaServletRegistrationBean() {
        ServletRegistrationBean kaptchaServletRegistrationBean = new ServletRegistrationBean(new KaptchaServlet(), "/kaptcha");
        kaptchaServletRegistrationBean.setName("kaptcha");
        return kaptchaServletRegistrationBean;
    }
}
