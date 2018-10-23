package com.project.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	@Autowired
	GoodsService g_service;
	
	//메인화면 상품 리스트
	@RequestMapping(value="/goodsMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsMain(HttpServletRequest req) throws Exception {
		
		g_service.goodsMain(req);
		
		return "goods/goodsMain";
		
	}
	
	//각 상품의 상품 리스트
	@RequestMapping(value="/goodsList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsLists(HttpServletRequest req) throws Exception {
		
		g_service.goodsList(req);

		return "goods/goodsList";
		
	}
	
	//상품 상세 페이지
	@RequestMapping(value="/goodsArticle.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String goodsArticle(HttpServletRequest req) throws Exception{

		g_service.goodsArticle(req);
		
		return "goods/goodsArticle";
	}
	
	@RequestMapping(value="/colorCheck.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String colorArticle(HttpServletRequest req) throws Exception{

		g_service.colorCheck(req);
		
		
		return "goods/goodsArticle";
	}
}
