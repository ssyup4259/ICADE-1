package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PostInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
		HttpSession session = request.getSession();
		
		//pre에서 가려던 주소를 올려준 세션을 받아와서 redirect시킨다.
		String url = (String)session.getAttribute("reqUrl");
		
		//System.out.println(url);
		
		response.sendRedirect(url);
	}
	
	
	
}