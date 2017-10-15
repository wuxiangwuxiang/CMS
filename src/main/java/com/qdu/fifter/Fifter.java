package com.qdu.fifter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "FA", urlPatterns = "/anna/*")
public class Fifter implements Filter {
	public Fifter() {
	}

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 获取用户信息
		HttpServletRequest hsr = (HttpServletRequest) request;
		if (hsr.getSession().getAttribute("studentId") != null) {
			// 如果有权限
			chain.doFilter(request, response);
		} else {
			// 跳转到无权限页面
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		}
	}

	// 未实现的初始化
	public void init(FilterConfig fConfig) throws ServletException {

	}



}
