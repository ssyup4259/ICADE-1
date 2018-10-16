package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.dto.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(true);
		
		String localhost = request.getRemoteAddr();
		
		String reqUrl = request.getRequestURL().toString(); // 요청url
		
		//System.out.println("preHandle1 : " + reqUrl);
		
		//if문으로 예외처리하여 true를 리턴해서 요청url로 그냥 통과시켜준다.
		if(reqUrl=="http://"+localhost+":8080/icade/login.action" || reqUrl.equals("http://"+localhost+":8080/icade/login.action")) {
			return true;
		}
		if(reqUrl=="http://"+localhost+":8080/icade/login_ok.action" || reqUrl.equals("http://"+localhost+":8080/icade/login_ok.action")) {
			return true;
		}
		if(reqUrl=="http://"+localhost+":8080/icade/" || reqUrl.equals("http://"+localhost+":8080/icade/")) {
			return true;
		}
		if(reqUrl=="http://"+localhost+":8080/icade/join.action" || reqUrl.equals("http://"+localhost+":8080/icade/join.action")) {
			return true;
		}
		
		
		session.setAttribute("reqUrl", reqUrl);
		
		//System.out.println("preHandle : " + handler);
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
        
        if ( vo == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect("/icade/login.action");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
          
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
	}

}
