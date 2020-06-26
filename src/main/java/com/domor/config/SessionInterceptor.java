package com.domor.config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
		System.out.println("request uri>>>>>>>>>>>>>>>>>>>>>>>>"+request.getRequestURI());
		// 验证session是否存在
		Object obj = request.getSession().getAttribute("user");
		if (obj == null) {
			PrintWriter out = response.getWriter();
			out.println("<html><script>");
			out.println("window.open ('/admin/toLogin','_top')");
			out.println("</script></html>");
			//response.sendRedirect("/toLogin");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {
	}

}
