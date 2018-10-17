package com.project.service;

import javax.servlet.http.HttpServletRequest;

public interface CartService {
	
	//장바구니 리스트
	HttpServletRequest cartList(HttpServletRequest req, String c_id) throws Exception;
	
	//장바구니 개별 비우기
	public String deleteCartItem(int c_num, String pageNum) throws Exception;
	
	//장바구니 개별 비우기
	public void deleteCartAll(String c_id) throws Exception;
	
	//장바구니 수량 수정
	public String updateCartItem(String c_code, int c_count) throws Exception;

}
