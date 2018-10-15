package com.project.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter{

	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp ,Object handler )throws Exception{
		//전처리기 메소드
		//컨트롤러가 실행되기 전에 실행된다.
		//현재 실해왼 URI가 무엇인지 알려주는 역할을 하게 된다.
		
		if (log.isDebugEnabled()) {
			
			log.debug("==========================================start=======================================");
			log.debug("Request URI\t: " + req.getRequestURI());
		}
		
		return super.preHandle(req, resp, handler);
		
	}
	
	public void postHandle(HttpServletRequest req, HttpServletResponse resp , Object handler, ModelAndView mav) throws Exception{
		//후처리기
		//컨트롤러가 실행 된 후에 실행된다.
		
		
		if (log.isDebugEnabled()) {
			log.debug("==========================================END=========================================");
		}
		super.postHandle(req, resp, handler, mav);
	}
	
}
