package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mypageController {

	@RequestMapping(value="/myPage", method = RequestMethod.POST)
	public String mypage(HttpServletRequest request,HttpServletResponse response) {
		
		
		
		return "mypageMain";
	}
	
}
