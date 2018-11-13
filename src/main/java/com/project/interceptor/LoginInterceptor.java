package com.project.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.dto.GoodsKindDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
private void saveData(HttpServletRequest req) {
		
		String uri = null;
		String query = null;
		
		HttpSession session = req.getSession();
		
		if ("XMLHttpRequest".equals(req.getHeader("X-Requested-With"))) {
			System.out.println("ajax 요청");
			uri = req.getRequestURI().toString(); // 요청 uri
			query = req.getQueryString();
		}else {
			uri = req.getRequestURI().toString(); // 요청 uri
			query = req.getQueryString();
			
			System.out.println(uri);
		}
		
		System.out.println(uri);
		
		if(query==null||query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			System.out.println("dest : " + (uri+query));
			session.setAttribute("dest", uri+query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("===================================intercepter");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo") == null||session.getAttribute("userInfo").equals(null)) {
			
			System.out.println("로그인 안되있음");
			
			saveData(request);
			
			response.sendRedirect("/icade/login.action");
			System.out.println("=======================response=======================================================");
			return false;
		}else {
			return true;
		}
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		return req;
        
    }
	
	

}
