package com.project.dao;

import java.util.HashMap;
import java.util.List;

import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;

public interface OrderHistoryDAO {
	
	//주문내역조회
	public List<Integer> selectOrderNum(String O_ID) throws Exception;
	
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

	//상품코드 안에 있는 상품의 종류
	public int countSearch(int OD_NUM) throws Exception;
	
	public List<OrderDetailDTO> selectOdSaveFileName(String	M_ID) throws Exception;
}
