package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.GoodsDetailDTO;

public interface BuyService {

	//단품 구매
	public HttpServletRequest buyOne(HttpServletRequest req, GoodsDetailDTO gd_dto) throws Exception;
	
	//여러개 구매(장바구니)
	public HttpServletRequest buyCart(HttpServletRequest req) throws Exception;

}
