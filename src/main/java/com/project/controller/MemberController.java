package com.project.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.CookieService;
import com.project.service.MemberService;
import com.project.service.WishService;
import com.project.util.CommandMap;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	CookieService c_service;
	@Autowired
	AdminDAO a_dao;
	@Autowired
	WishService w_service;
	
	@RequestMapping(value="/join.action",method= {RequestMethod.POST,RequestMethod.GET})
	public String joinForm(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp)throws Exception {
		
		c_service.cookieList(req);
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
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		Cookie[] cookies = req.getCookies();
		
		List<String> c_lists = new ArrayList<String>();
		
		if(cookies != null){
	
			for(int i=0; i<cookies.length; i++){
				
				Cookie ck = cookies[i];
				
				if (ck.getName().equals("JSESSIONID") || ck.getName().equals("Cookie_userid")) {
					
				} else {
					
					String g_num = ck.getName();
					c_lists.add(g_num);
				}
			}
		}
	
		req.setAttribute("c_lists", c_lists);
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
		
		
}
