package com.project.controller;

import java.util.HashMap;
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
		System.out.println("입장");
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String m_Id = dto.getM_ID();
		
		List<OrdersDTO> lists = (List<OrdersDTO>) service.selectOrders(m_Id);
		
		List<Integer> integerList = service.selectOrderNum(m_Id);
		
		List<OrderDetailDTO> detailList = service.selectOdSaveFileName(m_Id);
		/*
		System.out.println("for문돌린다====================================================");
		
		for(int i = 0;i<integerList.size();i++) {
			
			System.out.println(integerList);
			
			Integer O_Num = integerList.get(i);
			
			detailList.addAll(service.selectOdSaveFileName(O_Num)); 
			
			//List<Map<String, Object>> listsMap = detailList;
			request.setAttribute("detailList", detailList);
			
		}
		
		System.out.println("====================================================for문끝났다");
		*/
		
		request.setAttribute("detailList", detailList);
		request.setAttribute("lists", lists);
		request.setAttribute("integerList", integerList);
		
		System.out.println("올리고 리턴");
		
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
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String m_Id = dto.getM_ID();
		
		int O_Num = Integer.parseInt(request.getParameter("o_num"));
		
		List<OrderDetailDTO> detailLists = service.selectOdSaveFileName(m_Id);
		
		mav.addObject("O_Num", O_Num);
		//mav.addObject("detailLists",detailLists);
		
		request.setAttribute("detailLists", detailLists);
		
		mav.setViewName("/ordersHistory/orderHistoryDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/test.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String test(HttpServletRequest request,HttpServletResponse response) throws Exception {
		//실험용 추후 삭제
		return "ordersHistory/test";
	}
	
		
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	

}
