package com.domor.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@SuppressWarnings("deprecation")
public class SessionConfiguration implements WebMvcConfigurer {
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    // addPathPatterns 用于添加拦截规则
	    // excludePathPatterns 用户排除拦截
	    registry.addInterceptor(new SessionInterceptor())
	    		.addPathPatterns("/admin/**")
	    		.excludePathPatterns("/admin/toLogin","/admin/login");
	}
	
}
