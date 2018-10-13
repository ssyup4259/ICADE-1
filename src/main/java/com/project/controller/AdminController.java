package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.util.MyUtil;
import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
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
	
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.POST)
	public String insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		service.insertGoods(g_dto, gd_dto, req, resp);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	@RequestMapping(value="/goodsList.action", method= {RequestMethod.POST, RequestMethod.GET})
	public String goodsList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<GoodsKindDTO> gk_lists = service.getGoodsKindList();
		
		req = service.goodsList(req);
		req.setAttribute("gk_lists", gk_lists);
		
		return "admin/goodsList";
		
	}
	
	@RequestMapping(value="/deleteGoods.action", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int g_num = Integer.parseInt(req.getParameter("g_num"));
		
		service.deleteGoods(g_num);
		
		return "redirect:/admin/goodsList.action";
		
	}
	
	

}
