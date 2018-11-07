package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.AdminDAO;
import com.project.dao.NoticeDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.NoticeDTO;
import com.project.service.AdminService;
import com.project.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private NoticeService n_service;

	@Autowired
	NoticeDAO n_dao;

	//공지사항 게시판 
	@RequestMapping(value = "/noticeList.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    n_service.noticeList(request);
		
		return "notice/noticeList";
	}
	
	//공지 하나
	@RequestMapping(value = "/noticeDetail.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeDetail( HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDTO n_dto = new NoticeDTO();
		int BN_NUM = Integer.parseInt(request.getParameter("BN_NUM"));
		n_dto = n_service.getNoticeDetail(BN_NUM);
		request.setAttribute("n_dto", n_dto);
		return "notice/noticeDetail";
	}
	
	//등록화면으로 가기
	@RequestMapping(value = "/noticeRegister.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeRegister( HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "notice/noticeRegister";
	}
	
	@RequestMapping(value = "/noticeRegisterOK.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeRegisterOK(HttpServletRequest request, HttpServletResponse response, NoticeDTO dto) throws Exception {
		NoticeDTO n_dto = new NoticeDTO();
		
		return "redirect:/noticeList.action";
	}
	
}
