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
			if (lists.size() > 3) { // 값이 3개를 초과하면, 최근 것 3개만 담는다.
				int start = lists.size()-3;
				List<String> copyList = new ArrayList<String>();
				for (int i = start; i < lists.size() ; i++) {
				copyList.add(lists.get(i));
				
			  }

			  lists = copyList;
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
		Cookie[] cookies = req.getCookies();
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

	@RequestMapping(value="/cookieDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cookieDelete(String g_num,HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Cookie kc = new Cookie(g_num, null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
		
		kc.setMaxAge(0); // 유효시간을 0으로 설정

		resp.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
		
		return "redirect:cookieTest.action";
	}
	@RequestMapping(value="/cookieDelete_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String detalilDelete(String g_num,HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		Cookie kc = new Cookie(g_num, null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
		
		kc.setMaxAge(0); // 유효시간을 0으로 설정

		resp.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
		
		return "redirect:cookieTest.action";
	}
	
	
}
