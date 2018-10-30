package com.project.controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.service.AdminService;
import com.project.service.CookieService;
import com.project.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	@Autowired
	GoodsService g_service;
	
	@Autowired
	AdminDAO a_dao;
	@Autowired
	AdminService a_service;
	
	@Autowired
	CookieService c_service;
	
	//메인화면 상품 리스트
	@RequestMapping(value="/goodsMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsMain(HttpServletRequest req) throws Exception {
		
		g_service.goodsMain(req);
		
		c_service.cookieList(req);
		
		return "goods/goodsMain";
		
	}
	
	//각 상품의 상품 리스트
	@RequestMapping(value="/goodsList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsLists(HttpServletRequest req) throws Exception {
		
		g_service.goodsList(req);
		
		c_service.cookieList(req);
		

		return "goods/goodsList";
		
	}
	
	//상품 상세 페이지
	@RequestMapping(value="/goodsArticle.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String goodsArticle(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		GoodsDTO g_dto = c_service.cookieInsert(req);
		
		String g_num = Integer.toString(g_dto.getG_NUM());
		
		//List<String> lists = (List<String>) addAttributes(req);
		List<String> lists = (List<String>) req.getAttribute("c_lists");
		System.out.println("-------------------------------------lists 체크");
		System.out.println(lists);
		Iterator<String> it = lists.iterator();
		
		
		while (it.hasNext()) {
			String num = it.next();
			
			if (num == g_num || num.equals(g_num)) {
				Cookie setCookie = new Cookie(g_num, null);
				setCookie.setMaxAge(0);
				resp.addCookie(setCookie);
				break;
			}
			
		}
		
		Cookie setCookie = new Cookie(g_num, g_num);
		setCookie.setMaxAge(60*60*24);
		resp.addCookie(setCookie);
	
		
		
		g_service.goodsArticle(req);
		
		c_service.cookieList(req);
	
	
		return "goods/goodsArticle";
	}
	
	
	@RequestMapping(value="/colorCheck.action", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<GoodsDetailDTO> colorArticle(HttpServletRequest req) throws Exception{

		return g_service.colorCheck(req);
		
	}
	
	
	@ModelAttribute
	HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		Cookie[] cookies = req.getCookies();
		
		List<String> c_lists = new ArrayList<String>();
	
		if(cookies != null){
	
			for(int i=0; i<cookies.length; i++){
				
				Cookie ck = cookies[i];
				
				if (ck.getName().equals("JSESSIONID")) {
					
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
