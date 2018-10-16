package com.project.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dto.GoodsDTO;
import com.project.service.AdminService;
import com.project.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	@Autowired
	GoodsService service;
	
	@Autowired
	AdminService a_service;
	
	@RequestMapping(value="/", method= {RequestMethod.GET, RequestMethod.POST})
	public List<String> getCookie(HttpServletRequest req) {

		Cookie[] cookies = req.getCookies();

		List<String> lists = new ArrayList<String>();
	
		if(cookies != null){
	
			for(int i=0; i<cookies.length; i++){
		
				Cookie ck = cookies[i];
				
				if (ck.getName().equals("JSESSIONID")) {
					
				} else {
					String g_num = ck.getName();
					lists.add(g_num);
				}
				
			}
			
		}
		
		return lists;
		
	}
	
	//메인화면 상품 리스트
	@RequestMapping(value="/goodsMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsMain(HttpServletRequest req) throws Exception {
		
		service.goodsMain(req);
		
		return "goods/goodsMain";
		
	}
	
	//각 상품의 상품 리스트
	@RequestMapping(value="/goodsList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsLists(HttpServletRequest req) throws Exception {
		
		req.setAttribute("GK_KIND_NUM", req.getParameter("GK_KIND_NUM"));
		service.goodsList(req);

		return "goods/goodsList";
		
	}
	
	
	@RequestMapping(value="/imageTest.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String imageTest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		GoodsDTO g_dto = service.imageTest(req);
		
		String g_num = Integer.toString(g_dto.getG_NUM());
		
		Cookie setCookie = new Cookie(g_num, g_num);
		setCookie.setMaxAge(60*60*24);
		resp.addCookie(setCookie);
		
		req.setAttribute("g_dto", g_dto);
		
		return "goods/imageTest";
	}
	
	@RequestMapping(value="/cookieTest.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cookieTest(HttpServletRequest req) throws Exception {
		
		List<String> c_lists = new ArrayList<String>();		
		c_lists = getCookie(req);
		
		ListIterator<String> it = c_lists.listIterator();
		
		List<GoodsDTO> ck_lists = new ArrayList<GoodsDTO>();
		
		while (it.hasNext()) {
			
			GoodsDTO g_dto = new GoodsDTO();
			
			int g_num = Integer.parseInt(it.next());
			g_dto = a_service.getReadGoods(g_num);
		
			ck_lists.add(g_dto);
			
		}
		
		
		
		req.setAttribute("ck_lists", ck_lists);

		return "goods/cookie";
		
	}

}
