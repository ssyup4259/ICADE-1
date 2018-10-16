package com.project.service;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.project.dto.GoodsDTO;

public interface GoodsService {
	
	//메인 호출
	public HttpServletRequest goodsMain(HttpServletRequest req) throws Exception;
	
	//상품 리스트
	public HttpServletRequest goodsList(HttpServletRequest req) throws Exception;
	
	public GoodsDTO imageTest(HttpServletRequest req) throws Exception;
	
	public HttpServletRequest cookieTest(Cookie[] cookies, HttpServletRequest req) throws Exception;

}
