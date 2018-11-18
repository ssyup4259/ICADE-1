package com.project.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.CookieService;
import com.project.service.GoodsService;
import com.project.service.NoticeService;
import com.project.service.WishService;


@Controller
public class MainController {
	
	@Autowired
	GoodsService g_service;
	@Autowired
	CookieService c_service;
	@Autowired
	WishService w_service;
	@Autowired
	AdminDAO a_dao;
	@Autowired
	NoticeService n_service;

	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(HttpServletRequest req) throws Exception {
		List<String> lists = (List<String>) req.getAttribute("c_lists");
		g_service.goodsMain(req);
		c_service.cookieList(req);
		
		HttpSession session = req.getSession();
		MemberDTO mdto=(MemberDTO) session.getAttribute("userInfo");
		if(mdto != null) {
		w_service.wishList(req);
		}
		
		return "home";
	}
	
	@RequestMapping(value="/ji.action")
	public ModelAndView ji() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("buy/buy");
		return mav;
	}
	
	@RequestMapping(value="/faq.action")
	public ModelAndView faq(HttpServletRequest request) throws Exception {
		
		n_service.noticeList(request);
		c_service.cookieList(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("faq/faq");
		
		return mav;
		
	}
	
	@RequestMapping(value="/member/agree.action")
	public ModelAndView agree(HttpServletRequest request) throws Exception {
		
		c_service.cookieList(request);
		n_service.noticeList(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/agree");
		
		return mav;
	
	}
	@RequestMapping(value="/member/welcome.action")
	public ModelAndView welcome(HttpServletRequest request) throws Exception {
		
		c_service.cookieList(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinComplete");
		return mav;
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		MemberDTO vo = new MemberDTO();
		
		vo = (MemberDTO) session.getAttribute("userInfo");
		if(vo != null) {
			w_service.wishList(req);
			}
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
