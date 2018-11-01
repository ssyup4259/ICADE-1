package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.GoodsDetailDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;

public interface BuyDAO {
	
	public GoodsDetailDTO getReadGoodsDetail(String gd_code) throws Exception;
	
	//결제 후 상세상품 재고 감소
	public void goodsDetailCountDown(Map<String, Object> map) throws Exception;
	
	//환불 후 상세상품 재고 증가
	public void goodsDetailCountUp(Map<String, Object> map) throws Exception;
	
	//환불 후 배송상태 변경
	public void updateStatus(String o_num) throws Exception;
	
	//Orders maxNum 구하기
	public int ordersMaxNum() throws Exception;
	
	//Orders 테이블에 추가
	public void insertOrders(Map<String, Object> map) throws Exception;
	
	//상품의 정보 조회
	public GoodsDetailDTO getReadGoodsDetail(Map<String, Object> map) throws Exception;
	
	//Order_Detail 테이블에 추가
	public void insertOrderDetail(Map<String, Object> map) throws Exception;
	
	//Point 감소
	public void pointMinus(Map<String, Object> map) throws Exception;
	
	//Point 증가
	public void pointAdd(Map<String, Object> map) throws Exception;
	
	//주문 내역 조회
	public OrdersDTO getReadOrders(String o_num) throws Exception;
	
	//주문 상세 내역 조회
	public List<OrderDetailDTO> getReadOrderDetail(String o_num) throws Exception;
	
}
