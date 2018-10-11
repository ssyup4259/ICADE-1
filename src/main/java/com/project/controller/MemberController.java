package com.project.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;

@Controller
public class MemberController {
	

		@Autowired
		private MemberService memberService;
		
		
		@RequestMapping(value="/join.action",method= {RequestMethod.POST,RequestMethod.GET})
		public String joinForm(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp) {
			
			return "member/join";
		}
		
		@RequestMapping(value="/join_ok.action",method= {RequestMethod.POST,RequestMethod.GET})
		public String insertMember(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp)throws Exception {
			
			
			memberService.insertMember(m_dto);
			
			return "redirect:icade";
		}

		
		
		
	}
	
	


