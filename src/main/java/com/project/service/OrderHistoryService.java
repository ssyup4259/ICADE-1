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
	
	//주문내역 메인에 뿌려줄 값 조회
	public List<OrdersDTO> selectOrders(String O_ID) throws Exception;
	
	//상품코드를 통한 글번호(상품번호) 조회
	public int selectGoodsPage(int GD_CODE) throws Exception;
	
	//상품 번호로 저장된 이미지의 saveFileName 받기
	public String selectSaveFile(int G_NUM) throws Exception;
	
	//기간 지정 주문 내역 검사용 
	public List<OrdersDTO> selectOrdersCondition(HashMap<String, Object> hmap) throws Exception;
	
	//주문제품의 상세설명
	public List<OrderDetailDTO> selectOrderDetail(int O_Num) throws Exception;

	//페이징 처리를 위한 아이디의 해당 주문한 횟수
	public int maxOrders(HashMap<String, Object> hMap) throws Exception;
	
	public List<OrderDetailDTO> selectOdSaveFileName(HashMap<String, Object> hMap) throws Exception;
	
	//주문내여조회 메인 화면 뿌리기
	public List<OrderHistoryDTO> OrderHistoryMain(HashMap<String, Object> hMap) throws Exception;
	
	//개인 주문내역 주문 환불
	public String cancel(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}