package com.project.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.project.dao.AdminDAO;
import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.PaymentsDTO;
import com.project.service.AdminService;
import com.project.util.RestAPI;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService a_service;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	RestAPI api;
	
	//관리자 화면
	@RequestMapping(value="/adminMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminMain() throws Exception {
		
		return "admin/adminMain";
		
	}
	
	//상품 등록 화면(관리자용)
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.GET)
	public String insertForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_service.getGoodsKindList();
		List<DeviceKindDTO> dk_lists = a_service.getDeviceList();
		List<GoodsColorDTO> gc_lists = a_service.getColorList();
		
		req.setAttribute("gk_lists", gk_lists);
		req.setAttribute("dk_lists", dk_lists);
		req.setAttribute("gc_lists", gc_lists);
		
		return "admin/insertGoods";
		
	}
	
	//상품 등록(관리자용)
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.POST)
	public String insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req) throws Exception {
		
		a_service.insertGoods(g_dto, gd_dto, req);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	//상품 리스트(관리자용)
	@RequestMapping(value="/goodsList.action", method= {RequestMethod.POST, RequestMethod.GET})
	public String goodsList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_service.getGoodsKindList();
		
		req = a_service.goodsList(req);
		
		req.setAttribute("gk_lists", gk_lists);
		
		return "admin/goodsList";
		
	}
	
	//상품 삭제(관리자용)
	@RequestMapping(value="/deleteGoods.action", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int g_num = Integer.parseInt(req.getParameter("g_num"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/goodsImage");
		String cPath = req.getSession().getServletContext().getRealPath("/resources/goodsContentImage");
		
		a_service.deleteGoods(g_num, path, cPath);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	//상품 수정 화면(관리자용)
	@RequestMapping(value="/updateGoods.action", method=RequestMethod.GET)
	public String updateForm(int g_num, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		GoodsDTO g_dto = a_service.getReadGoods(g_num);
		
		req.setAttribute("g_dto", g_dto);
		
		return "admin/updateGoods";
		
	}
	
	//상품 수정(관리자용)
	@RequestMapping(value="/updateGoods.action", method=RequestMethod.POST)
	public void updateGoods(GoodsDTO g_dto, MultipartHttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		a_service.updateGoods(g_dto, req);
		
	}
	
	//상품 재고 수정 화면(관리자용)
	@RequestMapping(value="/updateGoodsDetailCount.action", method=RequestMethod.GET)
	public String updateGoodsDetailCountForm(int g_num, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		GoodsDTO g_dto = a_service.getReadGoods(g_num);
		
		List<GoodsDetailDTO> gd_lists = a_service.getReadGoodsDetail(g_num);
		
		req.setAttribute("gd_lists", gd_lists);
		req.setAttribute("g_name", g_dto.getG_NAME());
		
		return "admin/updateGoodsDetailCount";
		
	}
	
	//상품 재고 수정(관리자용)
	@RequestMapping(value="/updateGoodsDetailCount.action", method=RequestMethod.POST)
	public void updateGoodsDetailCount(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		a_service.updateGoodsDetailCount(req);
		
	}
	
	//회원 목록 화면
	@RequestMapping(value="/memberList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String memberList(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req = a_service.memberList(req);
		
		return "admin/memberList";
		
	}
	
	//회원 권한 변경
	@RequestMapping(value="/authorityChange.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String authorityChange(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		a_service.authorityChange(req);
		
		return memberList(req, resp);
		
	}
	
	//구매 환불 내역
	@RequestMapping(value="/payments.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String payments(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		a_service.payments(req);
		
		return "admin/payments";
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
