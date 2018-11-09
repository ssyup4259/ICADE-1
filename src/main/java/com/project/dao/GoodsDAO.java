package com.project.dao;

import java.util.List;

import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;

public interface GoodsDAO {
	
	//인기 상품 리스트
	public List<GoodsDTO> getPopularLists() throws Exception;
	
	//최신 상품 리스트
	public List<GoodsDTO> getNewLists() throws Exception;
	
	//회원용 상품 리스트
	public List<GoodsDTO> goodsList(int start, int end, String gdKindNum, String searchKey, String searchValue) throws Exception;
	
	//상품 개수 구하기
	public int getGoodsCount(String searchKey,String searchValue, String gdKindNum) throws Exception;
	

	
}
