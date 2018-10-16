package com.project.service;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	
	//메인 호출
	public HttpServletRequest goodsMain(HttpServletRequest req) throws Exception;

}
