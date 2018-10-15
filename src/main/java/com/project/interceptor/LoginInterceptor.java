package com.project.interceptor;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		
		String reqUrl = request.getRequestURL().toString();
		
		System.out.println("preHandle : " + reqUrl);
		
		if(reqUrl=="http://192.168.16.18:8080/icade/login.action" || reqUrl.equals("http://192.168.16.18:8080/icade/login.action")) {
			return true;
		}
		if(reqUrl=="http://192.168.16.18:8080/icade/login_ok.action" || reqUrl.equals("http://192.168.16.18:8080/icade/login_ok.action")) {
			return true;
		}
		if(reqUrl=="http://192.168.16.18:8080/icade/" || reqUrl.equals("http://192.168.16.18:8080/icade/")) {
			return true;
		}
		if(reqUrl=="http://192.168.16.18:8080/icade/join.action" || reqUrl.equals("http://192.168.16.18:8080/icade/join.action")) {
			return true;
		}
		
		
		session.setAttribute("reqUrl", reqUrl);
		
		//System.out.println("preHandle : " + handler);
		
		Object obj = session.getAttribute("userId");
        
        if ( obj == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect("/icade/login.action");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
          
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
	}
	
	/*
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		String reqUrl = (String) session.getAttribute("reqUrl");
		
		String postUrl = request.getRequestURL().toString();
		
		String userId = (String) session.getAttribute("userId");
		
		Object check = session.getAttribute("postCheck");
		
		session.setAttribute("postCheck", "test");
		
		System.out.println("----------------------------------postHandel start------------------------------------------");
		
		System.out.println("reqUrl : " + reqUrl);
		
		System.out.println(session.getAttribute("userId"));
		
		if(userId!=null && reqUrl!=null) {
			System.out.println("if문 1번째");
			if(postUrl!="http://192.168.16.18:8080/icade/login_ok.action" && !postUrl.equals("http://192.168.16.18:8080/icade/login.action")){
				System.out.println("if문 2번째");
				System.err.println("postUrl : " + postUrl);
				response.sendRedirect(reqUrl);
			}
		}
		
		System.out.println("----------------------------------postHandel end------------------------------------------");
		
		
	}*/

}
