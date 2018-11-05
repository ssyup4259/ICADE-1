package com.project.dao;

import java.util.HashMap;
import java.util.List;

import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;

public interface OrderHistoryDAO {
	
	//주문내역조회
	public List<Integer> selectOrderNum(HashMap<String, Object> hMap) throws Exception;
	
	//페이징 처리를 위한 아이디의 해당 주문한 횟수
	public int maxOrders(HashMap<String, Object> hMap) throws Exception;

	//상세정보보기 에서 뿌릴 셀렉트문
	public List<OrderDetailDTO> selectOrderDetail(HashMap<String, Object> hMap) throws Exception;
	
	//주문내역조회 메인 화면 뿌리기
	public List<OrderHistoryDTO> OrderHistoryMain(HashMap<String, Object> hMap) throws Exception;
	
	//주문상세페이지 받는사람 정보
	public OrdersDTO selectRecipientInfo(HashMap<String, Object> hMap) throws Exception;
	
}
