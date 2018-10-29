package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.GoodsDetailDTO;

public interface BuyService {
	
	public HttpServletRequest getReadGoodsDetail(HttpServletRequest req, GoodsDetailDTO gd_dto) throws Exception;

}
