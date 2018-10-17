package com.project.service;

import javax.servlet.http.HttpServletRequest;

public interface CartService {
	
	//장바구니 리스트
	HttpServletRequest cartList(HttpServletRequest req, String c_id) throws Exception;

}
