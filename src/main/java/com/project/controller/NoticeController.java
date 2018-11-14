package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.AdminDAO;
import com.project.dao.NoticeDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.NoticeDTO;
import com.project.service.CookieService;
import com.project.service.NoticeService;
import com.project.service.WishService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private NoticeService n_service;
	@Autowired
	AdminDAO a_dao;
	@Autowired
	WishService w_service;
	@Autowired
	CookieService c_service;
	@Autowired
	NoticeDAO n_dao;

	//공지사항 게시판 
	@RequestMapping(value = "/faq.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO vo = new MemberDTO();
		vo = (MemberDTO) session.getAttribute("userInfo");
		if(vo != null) {
			w_service.wishList(request);
			}
		c_service.cookieList(request);
		
		n_service.noticeList(request);
	
		return "faq/faq";
	
	}
	
	//공지 하나
	@RequestMapping(value = "/noticeDetail.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeDetail( HttpServletRequest request, HttpServletResponse response) throws Exception {
		c_service.cookieList(request);
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
	
	//공지 삭제
	@RequestMapping(value = "/noticeDelete.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeDelete( HttpServletRequest request, HttpServletResponse response) throws Exception {
		int BN_NUM = Integer.parseInt(request.getParameter("BN_NUM"));
		n_service.deleteNotice(BN_NUM);
		return "redirect:/faq.action";
	}
	
	//공지 수정페이지
	@RequestMapping(value = "/noticeUpdate.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeUpdate( HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDTO n_dto = new NoticeDTO();
		int BN_NUM = Integer.parseInt(request.getParameter("BN_NUM"));
		n_dto = n_service.getNoticeDetail(BN_NUM);
		request.setAttribute("n_dto", n_dto);
		
		return "notice/noticeUpdate";
	}
	
	//공지 수정하기
	@RequestMapping(value = "/noticeUpdateOk.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeUpdateOk( HttpServletRequest request, HttpServletResponse response) throws Exception {
		n_service.updateNotice(request);
		String BN_NUM = request.getParameter("BN_NUM");		
		String lists = "/notice/noticeDetail.action?BN_NUM="+ BN_NUM;
		
		return "redirect:" + lists;
	}
	
	
	@RequestMapping(value = "/noticeRegisterOK.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String noticeRegisterOK(NoticeDTO n_dto,HttpServletRequest request, HttpServletResponse response) throws Exception {
		n_service.noticeRegister(n_dto);
		return "redirect:/faq.action";
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {

		Cookie[] cookies = req.getCookies();
		
		List<String> c_lists = new ArrayList<String>();
		
		if(cookies != null){
	
			for(int i=0; i<cookies.length; i++){
				
				Cookie ck = cookies[i];
				
				if (ck.getName().equals("JSESSIONID") || ck.getName().equals("Cookie_userid")) {
					
				} else {
					
					String g_num = ck.getName();
					c_lists.add(g_num);
				}
			}
		}
	
		req.setAttribute("c_lists", c_lists);
		
		return req;
        
    }
	
}
