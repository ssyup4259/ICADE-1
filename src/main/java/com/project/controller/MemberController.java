package com.project.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			
			return "redirect:/";
		}

		@RequestMapping(value="/idcheck.action")
		@ResponseBody
		public Map<Object,Object> idcheck(@RequestBody String M_ID) throws Exception {
			
			//Json으로 넘어온 M_ID를 받는다.
			
			int count =0;
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			count = memberService.idCheck(M_ID);
			map.put("cnt", count);
			
			return map;
		}
		
	}
	
	


