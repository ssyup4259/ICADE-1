package com.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;
import com.project.service.OrderHistoryService;
import com.project.util.MyUtil;
import com.project.util.RestAPI;

@Controller
public class OrdersHistoryController {
	
	@Autowired
	private OrderHistoryService service;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	RestAPI api;

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
		
		String pageStart = request.getParameter("endPage");
		
		if(pageStart==null||pageStart.equals(null)) {
			pageStart = "1";
		}
		//int pageEnd = Integer.parseInt(request.getParameter("endPage")); 
		
		
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
			System.out.println("aa");
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
	
	@RequestMapping(value="/payment/cancel.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String test(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		//실험용 추후 삭제
		
		//-----------------------------------------------------------------------------------------
				String imp_key = URLEncoder.encode("0721555779852842", "UTF-8");
				String imp_secret = URLEncoder.encode("qSKG3wd6friMZRuJNne1gGg0CQ2gFks6ddNhJ0nZsGMrxgalEpnU5DUIuXYairhwF4Np4boxRaYpr9K5", "UTF-8");
				JsonObject json = new JsonObject();

				json.addProperty("imp_key", imp_key);
				json.addProperty("imp_secret", imp_secret);
				
				String token = api.getToken(req, resp, json);
				String header = "Bearer " + token;
				
				String imp_uid = req.getParameter("imp_uid");
				
				String apiUrl = "https://api.iamport.kr/payments/cancel";
				
				URL url = new URL(apiUrl);
		        HttpURLConnection con = (HttpURLConnection)url.openConnection();
		        con.setDoInput(true);
		        con.setDoOutput(true);
		        con.setUseCaches(false);
		        con.setRequestMethod("POST");
		        con.setRequestProperty("Authorization", header);
		        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		        
		        //매개변수 전달
		        OutputStream os = con.getOutputStream();
		        OutputStreamWriter writer = new OutputStreamWriter(os);
		        writer.write("imp_uid="+imp_uid);
		        writer.close();

		        os.close();
		        
		        int responseCode = con.getResponseCode();
		        BufferedReader br;
		        if(responseCode==200) { // 정상 호출
		            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            return "success";
		        } else {  // 에러 발생
		            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		        }
		        String inputLine;
		        StringBuffer sb = new StringBuffer();
		        while ((inputLine = br.readLine()) != null) {
		            sb.append(inputLine);
		        }
		        br.close();
				
				//-----------------------------------------------------------------------------------------
		
		return "fail";
	}
	
		
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	

}
