package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.CartDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;

public interface CartService {
	
	public void insertCartItem(String c_id, GoodsDTO g_dto, GoodsDetailDTO gd_dto) throws Exception;
	
	//장바구니 리스트
	HttpServletRequest cartList(HttpServletRequest req, String c_id) throws Exception;
	
	//장바구니 1개의 데이터
	public CartDTO getCartItem(String c_num) throws Exception;
	
	//장바구니 개별 비우기
	public String deleteCartItem(int c_num, String pageNum) throws Exception;
	
	//장바구니 개별 비우기
	public void deleteCartAll(String c_id) throws Exception;
	
	//장바구니 수량 수정
	public void updateCartItem(String c_code, int c_count) throws Exception;

}
