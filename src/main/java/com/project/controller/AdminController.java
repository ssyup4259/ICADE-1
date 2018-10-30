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
import com.project.service.AdminService;
import com.project.util.RestAPI;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
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
		
		List<GoodsKindDTO> gk_lists = service.getGoodsKindList();
		List<DeviceKindDTO> dk_lists = service.getDeviceList();
		List<GoodsColorDTO> gc_lists = service.getColorList();
		
		req.setAttribute("gk_lists", gk_lists);
		req.setAttribute("dk_lists", dk_lists);
		req.setAttribute("gc_lists", gc_lists);
		
		return "admin/insertGoods";
		
	}
	
	//상품 등록(관리자용)
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.POST)
	public String insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req) throws Exception {
		
		service.insertGoods(g_dto, gd_dto, req);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	//상품 리스트(관리자용)
	@RequestMapping(value="/goodsList.action", method= {RequestMethod.POST, RequestMethod.GET})
	public String goodsList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<GoodsKindDTO> gk_lists = service.getGoodsKindList();
		
		req = service.goodsList(req);
		
		req.setAttribute("gk_lists", gk_lists);
		
		return "admin/goodsList";
		
	}
	
	//상품 삭제(관리자용)
	@RequestMapping(value="/deleteGoods.action", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int g_num = Integer.parseInt(req.getParameter("g_num"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/goodsImage");
		String cPath = req.getSession().getServletContext().getRealPath("/resources/goodsContentImage");
		
		service.deleteGoods(g_num, path, cPath);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	//상품 수정 화면(관리자용)
	@RequestMapping(value="/updateGoods.action", method=RequestMethod.GET)
	public String updateForm(int g_num, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		GoodsDTO g_dto = service.getReadGoods(g_num);
		
		req.setAttribute("g_dto", g_dto);
		
		return "admin/updateGoods";
		
	}
	
	//상품 수정(관리자용)
	@RequestMapping(value="/updateGoods.action", method=RequestMethod.POST)
	public String updateGoods(GoodsDTO g_dto, MultipartHttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		service.updateGoods(g_dto, req);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	//상품 재고 수정 화면(관리자용)
	@RequestMapping(value="/updateGoodsDetailCount.action", method=RequestMethod.GET)
	public String updateGoodsDetailCountForm(int g_num, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		GoodsDTO g_dto = service.getReadGoods(g_num);
		
		List<GoodsDetailDTO> gd_lists = service.getReadGoodsDetail(g_num);
		
		req.setAttribute("gd_lists", gd_lists);
		req.setAttribute("g_name", g_dto.getG_NAME());
		
		return "admin/updateGoodsDetailCount";
		
	}
	
	//상품 재고 수정(관리자용)
	@RequestMapping(value="/updateGoodsDetailCount.action", method=RequestMethod.POST)
	public String updateGoodsDetailCount(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		service.updateGoodsDetailCount(req);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	//회원 목록 화면
	@RequestMapping(value="/memberList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String memberList(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req = service.memberList(req);
		
		return "admin/memberList";
		
	}
	
	//회원 권한 변경
	@RequestMapping(value="/authorityChange.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String authorityChange(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		service.authorityChange(req);
		
		//권한 변경 후 원래 검색 결과를 뿌려야함....
		
		return memberList(req, resp);
		
	}
	
	//구매 환불 내역
	@RequestMapping(value="/payments.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String payments(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String imp_key = URLEncoder.encode("0721555779852842", "UTF-8");
		String imp_secret = URLEncoder.encode("qSKG3wd6friMZRuJNne1gGg0CQ2gFks6ddNhJ0nZsGMrxgalEpnU5DUIuXYairhwF4Np4boxRaYpr9K5", "UTF-8");
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", imp_key);
		json.addProperty("imp_secret", imp_secret);
		
		String _token = api.getToken(req, resp, json);
		
		String imp_uid = "imp_493354362170";
		
		Map<String,String> map = api.getInfo(req, resp, _token, imp_uid);
		
		log.info(map.get("imp_uid"));
		log.info(map.get("status"));
		log.info(map.get("amount"));
		
		req.setAttribute("token", _token);
		
		return "admin/payments";
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
