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
import com.project.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.GET)
	public String insertForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<DeviceKindDTO> dk_lists = service.getDeviceList();
		List<GoodsColorDTO> gc_lists = service.getColorList();
		
		req.setAttribute("dk_lists", dk_lists);
		req.setAttribute("gc_lists", gc_lists);
		
		return "admin/insertGoods";
		
	}
	
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.POST)
	public String insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		service.insertGoods(g_dto, gd_dto, req, resp);
		
		return "redirect:admin/goodsList";
		
	}
	
	

}
