package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	CartService c_service;
	
	//장바구니 리스트
	@RequestMapping(value="/cartList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cartList(HttpServletRequest req) throws Exception {
		
		
		
		return "cart/cartList";
		
	}

}
