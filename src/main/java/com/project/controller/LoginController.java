package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dto.MemberDTO;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{

		
		return "loginTest";
	}
	
	@RequestMapping(value="/login_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login_ok(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{

		
		
		
		return "home";
	}

}
