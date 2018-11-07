package com.project.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;
import com.project.service.OrderHistoryService;
import com.project.util.MyUtil;

@Controller
public class OrdersHistoryController {
	
	@Autowired
	private OrderHistoryService service;
	
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value="/orderHistory.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String ordersHistoryMain(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		System.out.println("==================orderHistory.action 두번타는지 테스트용================================================");
		
		HttpSession session = request.getSession();
		MyUtil myUtil = new MyUtil();
		Date date = new Date();
		
		//로그인시 있는 유저의 세션정보를 받아온다.
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		//처음 날짜 검색하고 반환시 값일 있을경우 받고 아닐시 기본값처리 
		String startDate = (String) request.getParameter("startDay");
		String endDate = (String) request.getParameter("endDay");
		
		System.out.println("startDate : " + startDate);
		
		//페이징 처리를 위한 pgaeNum과 해당페이지의 시작 부분
		String pageNum = request.getParameter("pageNum");
		
		System.out.println("pageNum : " + pageNum);
		
		String basicStartDate = (date.getYear()+1900) + "-" + (date.getMonth()-2) + "-" + (date.getDate());
		
		String basicEndDate = (date.getYear()+1900) + "-" + (date.getMonth()+1) + "-" + date.getDate();
		
		if(startDate==null || startDate.equals(null)){
			startDate = basicStartDate; 
		}
		if(endDate==null || endDate.equals(null)) {
			endDate = basicEndDate;
		}
		
		String m_Id = dto.getM_ID();
		
		LinkedHashMap<Integer, List<OrderHistoryDTO>> hashMap = new LinkedHashMap<Integer, List<OrderHistoryDTO>>();
		
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
		
		hMap.put("start",start);
		hMap.put("end",end);
		
		// 페이징 처리

		String param = "";
		
		// 검색하고 기존의 창으로 돌아가기 위한 코딩
		if (!startDate.equals(basicStartDate)) {
			param = "startDay=" + startDate;
			param += "&endDay=" + endDate;
		}

		String listUrl = "orderHistory.action";

		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		List<Integer> integerList = service.selectOrderNum(hMap);
		
		System.out.println("for문돌린다====================================================");
		
		for(int i = 0;i<integerList.size();i++) {
			
			System.out.println(integerList);
			
			Integer O_Num = integerList.get(i);
			
			hMap.put("OD_NUM",O_Num);
			
			List<OrderHistoryDTO> mapList = service.OrderHistoryMain(hMap);
			
			hashMap.put(O_Num, mapList);
		}
		
		//System.out.println("====================================================for문끝났다");
		
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("hashMap", hashMap);
		
		return "ordersHistory/ordersHistoryMain";
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
		
		List<OrderDetailDTO> detailLists = service.selectOrderDetail(hMap);
		System.out.println("=======================detailLists통과====================");
		OrdersDTO Recipientdto = service.selectRecipientInfo(hMap);
		
		mav.addObject("O_Num", O_Num);
		//mav.addObject("detailLists",detailLists);
		
		request.setAttribute("detailLists", detailLists);
		request.setAttribute("Recipientdto", Recipientdto);
		
		mav.setViewName("/ordersHistory/orderHistoryDetail");
		
		return mav;
	}
	
	//개인 주문내역 주문 환불
	@RequestMapping(value="/payment/cancel.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String cancel(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		return service.cancel(req, resp);
	}
	
	//환불 후 DB정보 변경
	@RequestMapping(value="/payment/cancelOK.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String cancelOK(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		return service.cancelOK(req, resp);
		
	}
	
		
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	

}
