package com.project.dao;

import java.util.List;

import com.project.dto.CartDTO;

public interface CartDAO {
	
	//장바구니 리스트
	public List<CartDTO> getCartLists(int start, int end, String c_id) throws Exception;
	
	//장바구니에 담은 상품 개수 구하기
	public int getCartCount() throws Exception;
	
	//장바구니 개별 비우기
	public String deleteCartItem(int c_num, String pageNum) throws Exception;
	
	//장바구니 개별 비우기
	public void deleteCartAll(String c_id) throws Exception;

}
