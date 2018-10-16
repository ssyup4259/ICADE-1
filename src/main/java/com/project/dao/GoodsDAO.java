package com.project.dao;

import java.util.List;

import com.project.dto.GoodsDTO;

public interface GoodsDAO {
	
	//회원용 상품 리스트
	public List<GoodsDTO> goodsList(int start, int end, String gdKindNum, String searchKey, String searchValue) throws Exception;
	
	//상품 개수 구하기
	public int getGoodsCount(String searchKey,String searchValue) throws Exception;
	
}
