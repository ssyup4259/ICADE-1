package com.project.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.GoodsDTO;
import com.project.service.CookieService;

@Controller
@RequestMapping("/cookies/*")
public class CookieController {
	@Autowired
	CookieService c_service;
	
	
	@RequestMapping(value="/cookiedirect.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String cookiedirect(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Cookie[] cookies = req.getCookies();
		List<String> c_lists = new ArrayList<String>();
		int startIdx=0;
		int endIdx=0;
		int endJIndx=0;
		if(cookies != null){
		
			for(int i=0; i<cookies.length; i++){
				Cookie ck = cookies[i];
				if (ck.getName().equals("JSESSIONID") || ck.getName().equals("Cookie_userid")) {
				} else {
					String g_num = ck.getName();
					c_lists.add(g_num);
					
				}
				
			}
		}
		
		List<String> lists = c_lists;
		String g_num = req.getParameter("G_NUM");
		Iterator<String> it = lists.iterator();
		
		while (it.hasNext()) {
			String num = it.next();
			startIdx = g_num.indexOf("="); //주소에 특수문자가 올경우 자르기(특수 문자 3개 올경우)ㄴ
			endJIndx = g_num.indexOf("&");
			endIdx = g_num.indexOf("#");
			if(	endJIndx ==-1) {
				if(endIdx ==-1) {
					g_num = g_num.substring(startIdx+1);
				}else {
				g_num = g_num.substring(startIdx,endIdx);
				}
			}else {
				g_num = g_num.substring(startIdx,endJIndx);
				
			}
				
			if (num == g_num || num.equals(g_num)) {
				Cookie setCookie = new Cookie(g_num, null);
				setCookie.setMaxAge(0);
				setCookie.setPath("/");
				resp.addCookie(setCookie);
				break;
			}
			
		}
	
		startIdx = g_num.indexOf("=");
		endJIndx = g_num.indexOf("&");
		endIdx = g_num.indexOf("#");
	if(	endJIndx ==-1) {
		if(endIdx ==-1) {
			g_num = g_num.substring(startIdx+1);
		}else {
		g_num = g_num.substring(startIdx,endIdx);
		}
	}else {
		g_num = g_num.substring(startIdx,endJIndx);
		
	}
		Cookie setCookie = new Cookie(g_num, g_num);
		setCookie.setMaxAge(60*60*24);
		setCookie.setPath("/");
		resp.addCookie(setCookie);
	
		
	
		return "success";
	}
	
	
	@RequestMapping(value="/cookieDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String cookieDelete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String g_num = req.getParameter("G_NUM");
		int startIdx=0;
		int endIdx=0;
		startIdx = g_num.indexOf("=");
		endIdx = g_num.indexOf("#");
		if(endIdx ==-1) {
			g_num = g_num.substring(startIdx+1);
		}else {
		g_num = g_num.substring(startIdx,endIdx);
		}
		
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
			
			
			}
		
		}
		return "success";
	}

}
