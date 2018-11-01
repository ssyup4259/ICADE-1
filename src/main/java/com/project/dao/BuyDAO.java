package com.project.dao;

import java.util.Map;

import com.project.dto.GoodsDetailDTO;

public interface BuyDAO {
	
	public GoodsDetailDTO getReadGoodsDetail(String gd_code) throws Exception;
	
	//결제 후 상세상품 재고 감소
	public void goodsDetailCountDown(Map<String, String> map) throws Exception;
	
	//환불 후 상세상품 재고 증가
	public void goodsDetailCountUp(Map<String, String> map) throws Exception;
	
	//Orders maxNum 구하기
	public int ordersMaxNum() throws Exception;
	
	//Orders 테이블에 추가
	public void insertOrders(Map<String, String> map) throws Exception;
	
	//상품의 정보 조회
	public GoodsDetailDTO getReadGoodsDetail(Map<String, String> map) throws Exception;
	
	//Order_Detail 테이블에 추가
	public void insertOrderDetail(Map<String, String> map) throws Exception;
	
	//Point 감소
	public void pointMinus(Map<String, Object> map) throws Exception;
	
	//Point 증가
	public void pointAdd(Map<String, Object> map) throws Exception;
	
}
