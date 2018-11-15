package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OrderHistoryService {

	//주문내역조회 메인에 뿌려줄 데이터를 뽑아내는 부분
	public HttpServletRequest OrderHistoryMain(HttpServletRequest request) throws Exception;
	
	//주문상세페이지 정보
	public HttpServletRequest OrderHistoryDetail(HttpServletRequest request) throws Exception;
	
	//개인 주문내역 주문 환불
	public String cancel(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	
	//주문 환불 후 DB정보들 변경
	public String cancelOK(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}