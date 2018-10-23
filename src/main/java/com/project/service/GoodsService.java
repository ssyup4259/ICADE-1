package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.GoodsDTO;

public interface GoodsService {
	
	//메인 호출
	public HttpServletRequest goodsMain(HttpServletRequest req) throws Exception;
	
	//상품 리스트
	public HttpServletRequest goodsList(HttpServletRequest req) throws Exception;
	
	//상품 상세페이지
	public HttpServletRequest goodsArticle(HttpServletRequest req) throws Exception;

}
