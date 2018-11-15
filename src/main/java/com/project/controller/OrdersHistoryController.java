package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.CookieService;
import com.project.service.OrderHistoryService;
import com.project.service.WishService;

@Controller
public class OrdersHistoryController {
	
	@Autowired
	private OrderHistoryService oh_service;
	
	@Autowired
	AdminDAO a_dao;
	@Autowired
	CookieService c_service;
	@Autowired
	WishService w_service;
	
	//주문내역조회 메인페이지
	@RequestMapping(value="/orderHistory.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String ordersHistoryMain(HttpServletRequest request,HttpServletResponse response) throws Exception {
		c_service.cookieList(request);
		
		oh_service.OrderHistoryMain(request);
		
		return "ordersHistory/ordersHistoryMain";
	}

	//주문 상세 페이지
	@RequestMapping(value="/ordersHistoryDetail.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String ordersHistoryDetail(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		oh_service.OrderHistoryDetail(request);
		
		return "/ordersHistory/orderHistoryDetail";
	}
	
	//개인 주문내역 주문 환불
	@RequestMapping(value="/payment/cancel.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String cancel(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		return oh_service.cancel(req, resp);
	}
	
	//환불 후 DB정보 변경
	@RequestMapping(value="/payment/cancelOK.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String cancelOK(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		return oh_service.cancelOK(req, resp);
		
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
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");

		if(dto != null) {
			w_service.wishList(req);
		}
		req.setAttribute("c_lists", c_lists);
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    
    
}
	

}
