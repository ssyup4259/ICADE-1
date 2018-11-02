package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.AdminDAO;
import com.project.dao.BuyDAO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.OrdersDTO;
import com.project.service.BuyService;

@Controller
@RequestMapping("/buy/*")
public class BuyController {
	
	Logger log = LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	BuyDAO b_dao;
	
	@Autowired
	BuyService b_service;
	
	//구매 화면
	@RequestMapping(value="/buyForm.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String buyForm(HttpServletRequest req, GoodsDetailDTO gd_dto) throws Exception {
		
		if (req.getParameterValues("chk") == null || req.getParameterValues("chk").length < 1) {
			b_service.buyOne(req, gd_dto);
		} else {
			b_service.buyCart(req);
		}
		
		return "buy/buyForm";
		
	}
	
	//결제 완료 후 주문정보 DB에 insert
	@RequestMapping(value="/payIt.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String payIt(HttpServletRequest req, OrdersDTO o_dto) throws Exception {
		
		b_service.payIt(req, o_dto);
		
		return "success";
		
	}
	
	//구매 완료 후 이동 페이지
	@RequestMapping(value="/buyOK.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String buyOK(HttpServletRequest req, HttpServletResponse resp, OrdersDTO o_dto) throws Exception {
		
		String cnums[] = req.getParameterValues("cnum");
		
		for (int i = 0; i < cnums.length; i++) {
			
			b_dao.deleteCartItems(cnums[i]);
			
		}
		
		return "success";
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
