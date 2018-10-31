package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.GoodsDTO;

public interface CookieService {
	
	public GoodsDTO cookieInsert(HttpServletRequest req)throws Exception;
	
	
	public HttpServletRequest cookieList(HttpServletRequest req)throws Exception;
	
}
