//package com.project.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.project.dao.AdminDAO;
//import com.project.dao.NoticeDAO;
//import com.project.dto.GoodsKindDTO;
//import com.project.dto.NoticeDTO;
//import com.project.service.AdminService;
//import com.project.service.NoticeService;
//
//@Controller
//@RequestMapping("/notice/*")
//public class NoticeController {
//	Logger log = LoggerFactory.getLogger(AdminController.class);
//
//	@Autowired
//	private NoticeService service;
//
//	@Autowired
//	NoticeDAO n_dao;
//
//	@RequestMapping(value = "/noticeList.action", method = { RequestMethod.POST, RequestMethod.GET })
//	public String notice(HttpServletRequest request, HttpServletResponse response) throws Exception {
//
//		request = service.noticeList(request);
//
//	//	request.setAttribute("n_lists", n_lists);
//
//		return "admin/goodsList";
//		return "/notice/noticeList";
//	}
//
//}
