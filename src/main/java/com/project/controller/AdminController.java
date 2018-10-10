package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.util.MyUtil;
import com.project.dto.GoodsDTO;
import com.project.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.GET)
	public String insertForm(GoodsDTO g_dto, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		return "admin/insertGoods";
		
	}
	
	@RequestMapping(value="/insertGoods.action", method=RequestMethod.POST)
	public String insertGoods(GoodsDTO g_dto, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		service.insertGoods(g_dto);
		
		return "redirect:admin/goodsList";
		
	}
	
	

}