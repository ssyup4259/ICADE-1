package com.project.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cookies/*")
public class CookieController {
	
	@RequestMapping(value="/cookieDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String cookieDelete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String g_num = req.getParameter("G_NUM");
		
		System.out.println(g_num);
		
		Cookie kc = new Cookie(g_num, null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
		
		kc.setMaxAge(0); // 유효시간을 0으로 설정
		kc.setPath("/");
		resp.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
	
		
		return "success";
	}
	
	@RequestMapping(value="/cookieDelete_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String detalilDelete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Cookie[] cookies = req.getCookies();

		if(cookies != null){

			for(int i=0; i< cookies.length; i++){
	
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
				cookies[i].setPath("/");
				resp.addCookie(cookies[i]); 
			
				System.out.println("쿠키확인------------------------------------------------------------------------------");
				System.out.println(cookies[i].getName());
			}
		
		}
		return "success";
	}

}
