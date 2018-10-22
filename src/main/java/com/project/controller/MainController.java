package com.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.GoodsService;


@Controller
public class MainController {
	
	@Autowired
	GoodsService g_service;
	
	
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
	
	
	
}
