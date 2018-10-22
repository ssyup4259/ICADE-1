package com.project.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.MemberDTO;
import com.project.service.OrderHistoryService;

@Controller
public class OrdersHistoryController {
	
	@Autowired
	private OrderHistoryService service;
	
	@RequestMapping(value="/orderHistory.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String ordersHistoryMain(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		return "ordersHistory/ordersHistoryMain";
	}
	
	@RequestMapping(value="/orderHistory_ok.action",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ordersHistory(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		List<Integer> lists = service.selectOrderNum(dto.getM_ID());
		
		
		/*
		
		integer 가 int 처럼 <c:for문으로 뿌려진다고 생각하고 변환없이 시도
		
		Iterator<Integer> it = lists.iterator();
		
		int i = 1;
		
		while(it.hasNext()) {
			
		}
		*/
		
		mav.addObject("lists", lists);
		
		
		mav.addObject("");
		mav.setViewName("/ordersHistory/ordersHistoryMain");
		
		return mav;
	}
	

}
