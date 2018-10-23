package com.project.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.service.GoodsService;


@Controller
public class MainController {
	
	@Autowired
	GoodsService g_service;
	
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) throws Exception {
		
		g_service.goodsMain(req);
		
		return "home";
	}
	
	@RequestMapping(value="/ji.action")
	public ModelAndView ji() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("buy/buy");
		return mav;
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	
	
	
}
