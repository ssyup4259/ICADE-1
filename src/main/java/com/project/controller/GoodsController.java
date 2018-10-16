package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	@Autowired
	GoodsService service;
	
	//관리자 화면
		@RequestMapping(value="/goodsMain.action", method= {RequestMethod.GET, RequestMethod.POST})
		public String goodsMain(HttpServletRequest req) throws Exception {
			
			service.goodsMain(req);
			
			return "goods/goodsMain";
			
		}

}
