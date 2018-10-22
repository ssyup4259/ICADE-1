package com.project.dao;

import java.util.List;

import com.project.dto.CartDTO;

public interface CartDAO {
	
	//장바구니 추가
	public void insertCartItem(CartDTO c_dto) throws Exception;
	
	//장바구니 리스트
	public List<CartDTO> getCartLists(int start, int end, String c_id) throws Exception;
	
	//장바구니 1개의 데이터
	public CartDTO getCartItem(String c_num) throws Exception;
	
	//장바구니에 담은 상품 개수 구하기
	public int getCartCount(String c_id) throws Exception;
	
	//장바구니 개별 비우기
	public String deleteCartItem(int c_num, String pageNum) throws Exception;
	
	//장바구니 전체 비우기
	public void deleteCartAll(String c_id) throws Exception;
	
	//장바구니 수량 수정
	public void updateCartItem(String c_code, int c_count) throws Exception;
	
	//상품코드별 재고수량
	public int countGoods(String c_code) throws Exception;

}
