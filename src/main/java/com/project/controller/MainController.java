package com.project.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.service.CookieService;
import com.project.service.GoodsService;


@Controller
public class MainController {
	
	@Autowired
	GoodsService g_service;
	@Autowired
	CookieService c_service;
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(HttpServletRequest req) throws Exception {
		System.out.println("------------------------------req 확인");
		System.out.println(req);
		List<String> lists = (List<String>) req.getAttribute("c_lists");
		System.out.println("-------------------------------------lists 체크");
		System.out.println(lists);
		g_service.goodsMain(req);
		c_service.cookieList(req);
		
		return "home";
	}
	
	@RequestMapping(value="/ji.action")
	public ModelAndView ji() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("buy/buy");
		return mav;
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		Cookie[] cookies = req.getCookies();
		
		List<String> c_lists = new ArrayList<String>();
		
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
	
		
		req.setAttribute("c_lists", c_lists);
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	
}
