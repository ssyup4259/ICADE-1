package com.project.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.project.dao.BuyDAO;
import com.project.dao.OrderHistoryDAO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;
import com.project.util.MyUtil;
import com.project.util.RestAPI;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryDAO oh_dao;
	
	@Autowired
	private BuyDAO b_dao;
	
	@Autowired
	RestAPI api;
	
	//주문내역조회 메인페이지
	@Override
	public HttpServletRequest OrderHistoryMain(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		MyUtil myUtil = new MyUtil();
		Date date = new Date();
		
		//로그인시 있는 유저의 세션정보를 받아온다.
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		//처음 날짜 검색하고 반환시 값일 있을경우 받고 아닐시 기본값처리 
		String startDate = (String) request.getParameter("startDay");
		String endDate = (String) request.getParameter("endDay");
		
		//페이징 처리를 위한 pgaeNum과 해당페이지의 시작 부분
		String pageNum = request.getParameter("pageNum");
		
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
		
		//기간별 총 주문횟수
		int dataCount = oh_dao.maxOrders(hMap);
		
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
		
		//기간별 주문 번호 리스트
		List<Integer> integerList = oh_dao.selectOrderNum(hMap);
		
		for(int i = 0;i<integerList.size();i++) {
			
			System.out.println(integerList);
			
			Integer O_Num = integerList.get(i);
			
			hMap.put("OD_NUM",O_Num);
			
			//for문으로 뿌려줄 리스트
			List<OrderHistoryDTO> mapList = oh_dao.OrderHistoryMain(hMap);
			
			//key값으로 주문번호를 벨류값으로 주문번호에 따른 주문 내역
			hashMap.put(O_Num, mapList);
		}
		
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("orderDataCount", dataCount);
		request.setAttribute("orderPageIndexList", pageIndexList);
		request.setAttribute("hashMap", hashMap);
		
		return request;
	}

	//주문 상세 페이지
	@Override
	public HttpServletRequest OrderHistoryDetail(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String m_Id = dto.getM_ID();
		
		int O_Num = Integer.parseInt(request.getParameter("o_num"));
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("O_ID", m_Id);
		hMap.put("O_NUM", O_Num);
		
		List<OrderDetailDTO> detailLists = oh_dao.selectOrderDetail(hMap);
		OrdersDTO Recipientdto = oh_dao.selectRecipientInfo(hMap);
		
		request.setAttribute("O_Date", Recipientdto.getO_DATE());
		request.setAttribute("O_Num", O_Num);
		request.setAttribute("detailLists", detailLists);
		request.setAttribute("Recipientdto", Recipientdto);
		
		return request;
	}


	//개인 주문내역 주문 환불
	@Override
	public String cancel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String imp_key = URLEncoder.encode("0721555779852842", "UTF-8");
		String imp_secret = URLEncoder.encode("qSKG3wd6friMZRuJNne1gGg0CQ2gFks6ddNhJ0nZsGMrxgalEpnU5DUIuXYairhwF4Np4boxRaYpr9K5", "UTF-8");
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", imp_key);
		json.addProperty("imp_secret", imp_secret);
		
		String token = api.getToken(json);
		String header = "Bearer " + token;
		
		String imp_uid = req.getParameter("imp_uid");
		String o_num = req.getParameter("o_num");
		
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
            return o_num;
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer sb = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            sb.append(inputLine);
        }
        br.close();
        
        return "fail";
		
	}

	//주문 환불 후 DB정보들 변경
	@Override
	@Transactional
	public String cancelOK(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 주문상태 변경
		String o_num = req.getParameter("o_num");
		b_dao.updateStatus(o_num);
		
		// 해당 상품들 재고 수량 증가, 판매 수량 감소
		List<OrderDetailDTO> od_lists = b_dao.getReadOrderDetail(o_num);
		
		Iterator<OrderDetailDTO> it = od_lists.iterator();
		
		while (it.hasNext()) {
			
			OrderDetailDTO od_dto = it.next();
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("code", od_dto.getOD_CODE());
			map.put("count", od_dto.getOD_COUNT());
			
			b_dao.goodsDetailCountUp(map);
			
		}
		
		// 포인트 증가
		OrdersDTO o_dto = b_dao.getReadOrders(o_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("m_point", o_dto.getO_POINT());
		map.put("m_id", o_dto.getO_ID());
		
		b_dao.pointAdd(map);
		
		return "success";
	}


}
