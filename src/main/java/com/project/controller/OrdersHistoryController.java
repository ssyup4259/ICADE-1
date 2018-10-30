package com.project.controller;

import java.util.Date;
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
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;
import com.project.service.OrderHistoryService;
import com.project.util.MyUtil;

import oracle.sql.DATE;

@Controller
public class OrdersHistoryController {
	
	@Autowired
	private OrderHistoryService service;
	
	@Autowired
	AdminDAO a_dao;

	@RequestMapping(value="/orderHistory.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String ordersHistoryMain(HttpServletRequest request,HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MyUtil myUtil = new MyUtil();
		Date date = new Date();
		
		//로그인시 있는 유저의 세션정보를 받아온다.
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		//처음 날짜 검색하고 반환시 값일 있을경우 받고 아닐시 기본값처리 
		String startDate = (String) request.getParameter("startDay");
		String endDate = (String) request.getParameter("endDay");
		String pageNum = request.getParameter("pageNum");
		
		if(startDate==null || startDate.equals(null)){
			startDate = (date.getYear()+1900) + "-" + (date.getMonth()-2) + "-" + (date.getDate()); 
		}
		if(endDate==null || endDate.equals(null)) {
			endDate = (date.getYear()+1900) + "-" + (date.getMonth()+1) + "-" + date.getDate();
		}
		
		//System.out.println(startDate + "-" + endDate);
		
		String m_Id = dto.getM_ID();
		
		HashMap<Integer, List<OrderHistoryDTO>> hashMap = new HashMap<Integer, List<OrderHistoryDTO>>();
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("O_ID", m_Id);
		hMap.put("start_date",startDate);
		hMap.put("end_date",endDate);	
		
		//현재 페이지
        int currentPage = 1;
		
		// 페이지number처리
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int numPerPage = 5;
		
		int dataCount = service.maxOrders(hMap);
		
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		String listUrl = "orderHistory.action";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		List<OrdersDTO> lists = (List<OrdersDTO>) service.selectOrders(m_Id);
		
		List<Integer> integerList = service.selectOrderNum(hMap);
		
		System.out.println("for문돌린다====================================================");
		
		for(int i = 0;i<integerList.size();i++) {
			
			System.out.println(integerList);
			
			Integer O_Num = integerList.get(i);
			
			hMap.put("OD_NUM",O_Num);
			
			List<OrderHistoryDTO> mapList = service.OrderHistoryMain(hMap);
			
			hashMap.put(O_Num, mapList);
			
		}
		
		System.out.println("====================================================for문끝났다");
		
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("hashMap", hashMap);
		request.setAttribute("lists", lists);
		request.setAttribute("integerList", integerList);
		
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
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("O_ID", m_Id);
		hMap.put("O_NUM", O_Num);
		
		List<OrderDetailDTO> detailLists = service.selectOdSaveFileName(hMap);
		
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
