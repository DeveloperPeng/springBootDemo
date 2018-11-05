package com.wp.manager.config;

import com.wp.manager.interceptor.DefaultInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.config.annotation.*;

import javax.servlet.annotation.MultipartConfig;

/**
 * @author wp
 * @since 2018/8/31 15:34
 */
@Configuration
@EnableWebMvc
@EnableSpringDataWebSupport //启用spring-data-jpa
@ComponentScan(basePackages = "com.wp.manager.controller", useDefaultFilters = false, includeFilters = @ComponentScan.Filter(value = {Controller.class, ControllerAdvice.class}))
//使用注解扫描管理bean时，涉及到spring的ioc容器和springMvc容器，通常使用springMvc容器管理Controller，其他的类如@Service、@Component等注解标识的类由spring来管理
//ComponentScan注解默认useDefaultFilters = true 扫描所有的@Controller、@Service等，因为springMvc管理这些bean会导致spring事务无效
//所以只指定需要springMvc管理的bean
@MultipartConfig //servlet文件上传注解
public class WebConfig extends WebMvcConfigurerAdapter {

    //WebMvcConfigurerAdapter配置类是spring内部的一种配置方式，采用javabean用来代替xml

    @Autowired
    private DefaultInterceptor defaultInterceptor;


    /**
     * 重写configurePathMatch此方法
     * 设置其参数PathMatchConfigurer的属性UseSuffixPatternMatch值为false
     * 可以让路径中带小数点“.”后面的值不被忽略
     */
    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.setUseSuffixPatternMatch(false); //设置是否是后缀模式匹配,默认true
    }

    /**
     * 配置静态访问资源
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/","classpath:/static/");
        registry.addResourceHandler("/favicon.ico").addResourceLocations("/","classpath:/static//favicon.ico");

    }

    /**
     * 简化页面的跳转。
     * @param registry
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        super.addViewControllers(registry);
        registry.addViewController("/error").setViewName("error");
        registry.addViewController("/").setViewName("redirect:/dashboard");
        registry.addViewController("/unauthorized").setViewName("unauthorized");
        registry.addViewController("/welcome").setViewName("welcome");
        registry.addViewController("/success").setViewName("success");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        super.addInterceptors(registry);

        registry.addInterceptor(defaultInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/static/**")
                .excludePathPatterns("/plugins/**")
                .excludePathPatterns("sigout/**")
                .excludePathPatterns("kaptcha");
    }

















}
