package com.project.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PostInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("============================postHandle=======================");
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object userVo = modelMap.get("userVo");
		
		if(userVo != null) {
			System.out.println("새로 로그인 성공");
			session.setAttribute("userInfo", userVo);
			//response.sendRedirect("/");
			
			Object dest = session.getAttribute("dest");
			
			System.out.println(session.getAttribute("dest"));
			System.out.println(session.getAttribute("userInfo"));
			
			response.sendRedirect(dest != null ? (String)dest:"/icade");
			
		}else {
			response.sendRedirect("/icade");
		}
	
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		return req;
        
    }
	
	
	
}
