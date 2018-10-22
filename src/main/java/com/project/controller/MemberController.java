package com.project.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;
import com.project.util.CommandMap;

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
			
			return "redirect:/";
		}

		@RequestMapping(value="/idcheck.action")
		@ResponseBody
		public int idCheck(CommandMap commandMap)throws Exception{
			int idCheckResult = memberService.idCheck(commandMap.getMap());
			
			return idCheckResult;
			
		}
		@RequestMapping(value="/nickcheck.action")
		@ResponseBody
		public int nickCheck(CommandMap commandMap)throws Exception{
			
			
			int nickCheckResult = memberService.nickCheck(commandMap.getMap());
			
			return nickCheckResult;
			
		}
		@RequestMapping(value="/emailcheck.action")
		@ResponseBody
		public int emailCheck(CommandMap commandMap)throws Exception{
			
			int emailCheckResult = memberService.emailCheck(commandMap.getMap());
			
			
			return emailCheckResult;
		}
	}
	
	


