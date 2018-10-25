package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;
import com.project.service.OrderHistoryService;

@Controller
public class OrdersHistoryController {
	
	@Autowired
	private OrderHistoryService service;
	
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value="/orderHistory.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String ordersHistoryMain(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		List<OrderDetailDTO> orderList = new ArrayList<OrderDetailDTO>(); 
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		HashMap<Integer, Object> hMap = new HashMap<Integer, Object>();
		
		String m_Id = dto.getM_ID();
		
		List<OrdersDTO> lists = (List<OrdersDTO>) service.selectOrders(m_Id);
		
		List<Integer> integerList = service.selectOrderNum(m_Id);
		
		
		
		System.out.println("for문돌린다====================================================");
		
		for(int i = 0;i<integerList.size();i++) {
			
			System.out.println(integerList);
			
			Integer O_Num = integerList.get(i);
			
			int countOrder = service.countSearch(O_Num);
			
			orderList = (List<OrderDetailDTO>) service.selectOrderDetail(O_Num);
		
			hMap.put(O_Num, countOrder);
			
		}
		
		System.out.println("====================================================for문끝났다");
		
		
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("hMap", hMap);
		request.setAttribute("lists", lists);
		
		return "ordersHistory/ordersHistoryMain";
	}
	
	@RequestMapping(value="/orderHistory_ok.action",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ordersHistory(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String m_Id = dto.getM_ID();

		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		String startDay = (String) request.getParameter("startDay");
		String endDay = (String) request.getParameter("endDay");
		
		/*
		<option value="all">전체 주문처리상태</option>
		<option value="shipped_before">입금전</option>
		<option value="shipped_standby">배송준비중</option>
		<option value="shipped_begin">배송중</option>
		<option value="shipped_complate">배송완료</option>
		<option value="order_cancel">취소</option>
		<option value="order_exchange">교환</option>
		<option value="order_return">반품</option>
		*/
		
		//where O_STATUS = O_STATUS 조건 주면 상관없이 모두다 나오는듯
		
		hMap.put("startDay", startDay);
		hMap.put("endDay", endDay);
		
		System.out.println(startDay);
		System.out.println(endDay);
		
		List<OrdersDTO> lists = service.selectOrdersCondition(hMap);
		
		System.out.println("2");
		
		mav.addObject("lists", lists);
		
		mav.addObject("");
		mav.setViewName("/ordersHistory/ordersHistoryMain");
		
		return mav;
	}
	
	@RequestMapping(value="/ordersHistoryDetail.action",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ordersHistoryDetail(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String o_num = request.getParameter("o_num");
		
		mav.addObject("o_num", o_num);
		
		
		
		mav.setViewName("/ordersHistory/orderHistoryDetail");
		
		return mav;
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	

}
