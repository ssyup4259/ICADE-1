package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dto.MemberDTO;
import com.project.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	CartService c_service;
	
	//장바구니 리스트
	@RequestMapping(value="/cartList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cartList(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) session.getAttribute("userInfo");
		String c_id = m_dto.getM_ID();
		
		c_service.cartList(req, c_id);
		
		return "cart/cartList";
		
	}
	
	//장바구니 추가
	@RequestMapping(value="/insertCart.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertCart(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) session.getAttribute("userInfo");
		String c_id = m_dto.getM_ID();
		
		return "";
		
	}

}
