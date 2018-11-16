package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
private void saveData(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		String uri = req.getRequestURI().toString(); // 요청 uri
		String query = req.getQueryString();
		
		if(query==null||query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			session.setAttribute("dest", uri+query);
		}else {
			session.setAttribute("dest", uri);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo") == null||session.getAttribute("userInfo").equals(null)) {
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				if(request.getRequestURI().toString().equals("/icade/cart/insertCheck.action")||request.getRequestURI().toString().equals("/icade/wish/wishInsert.action")) {
					session.setAttribute("dest", "/icade/goods/goodsArticle.action?G_NUM="+session.getAttribute("g_num"));
					response.sendError(911);
					return false;
				}else if(request.getRequestURI().toString().equals("/icade/goods/commentInsert.action")){
					session.setAttribute("dest", "/icade/goods/goodsArticle.action?G_NUM="+session.getAttribute("g_num"));
					response.sendError(911);
					return false;
				}else {
					response.sendError(901);
					return false;
				}
			}else {
				saveData(request);
				response.sendRedirect("/icade/login.action");
				return false;
			}
		}else {
			return true;
		}
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		return req;
    }
	
	

}
