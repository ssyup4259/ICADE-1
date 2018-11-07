package com.project.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;

public interface OrderHistoryService {

	//주문내역조회
	public List<Integer> selectOrderNum(HashMap<String, Object> hMap) throws Exception;
	
	//페이징 처리를 위한 아이디의 조건에 해당하는 주문한 횟수
	public int maxOrders(HashMap<String, Object> hMap) throws Exception;
	
	//상세정보보기 에서 뿌릴 셀렉트문
	public List<OrderDetailDTO> selectOrderDetail(HashMap<String, Object> hMap) throws Exception;
	
	// 주문내역조회 메인에 뿌려줄 데이터를 뽑아내는 부분
	public List<OrderHistoryDTO> OrderHistoryMain(HashMap<String, Object> hMap) throws Exception;
	
	//주문상세페이지 받는사람 정보
	public OrdersDTO selectRecipientInfo(HashMap<String, Object> hMap) throws Exception;
	
	//개인 주문내역 주문 환불
	public String cancel(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	
	//주문 환불 후 DB정보들 변경
	public String cancelOK(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}