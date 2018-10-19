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
		req.setAttribute("G_NUM", req.getParameter("G_NUM"));
		req.setAttribute("GK_KIND_NUM", req.getParameter("GK_KIND_NUM"));
		service.goodsList(req);

		return "goods/goodsList";
		
	}
	
	
	@RequestMapping(value="/imageTest.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String imageTest(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		GoodsDTO g_dto = service.imageTest(req);
		
		String g_num = Integer.toString(g_dto.getG_NUM());
		
		List<String> lists = getCookie(req);
		
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
	
		
		req.setAttribute("g_dto", g_dto);
		
		return "goods/imageTest";
	}
	
	@RequestMapping(value="/cookieTest.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cookieTest(HttpServletRequest req) throws Exception {
		
		List<String> c_lists = new ArrayList<String>();		
		c_lists = getCookie(req);
		
		List<GoodsDTO> ck_lists = new ArrayList<GoodsDTO>();
		
		int count=0;
		
		for (int i = c_lists.size(); i > 0; i--) {
				
			GoodsDTO g_dto = new GoodsDTO();
			
			int g_num = Integer.parseInt(c_lists.get(i-1));
			
			g_dto = a_service.getReadGoods(g_num);
		
			ck_lists.add(g_dto);
			
			count++;
			
			if (count == 3) {
				break;
			}
				
		}
		
		req.setAttribute("ck_lists", ck_lists);

		return "goods/cookie";
		
	}

	@RequestMapping(value="/cookieDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cookieDelete(String g_num,HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Cookie kc = new Cookie(g_num, null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
		
		kc.setMaxAge(0); // 유효시간을 0으로 설정

		resp.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
		
		return "redirect:cookieTest.action";
	}
	@RequestMapping(value="/cookieDelete_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String detalilDelete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Cookie[] cookies = req.getCookies();

		if(cookies != null){

		for(int i=0; i< cookies.length; i++){

		cookies[i].setMaxAge(0); // 유효시간을 0으로 설정

		resp.addCookie(cookies[i]); 
	
		
		}
		}
		return "redirect:cookieTest.action";
	}
	
	
	}
