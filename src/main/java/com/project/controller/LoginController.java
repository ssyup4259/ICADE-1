package com.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.AdminDAO;
import com.project.dao.LoginDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value="/login.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		System.out.println("login.action");
		return "login/login";
	}
	
	@RequestMapping(value="/login_ok.action", method=RequestMethod.POST)
	public String login_ok(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String M_ID = req.getParameter("M_ID");
		String M_PW = req.getParameter("M_PW");
		
		//System.out.println(M_ID);
		//System.out.println(M_PW);
		
		HttpSession session = req.getSession();
		//System.out.println("service전");
		MemberDTO dto = service.checkInfo(M_ID);
		
		//System.out.println(dto.getM_ID());
		
		if(dto==null || dto.equals(null)) {
			System.out.println("dto가 널일시 뜬다.");
			
			String msg = "아이디가 없습니다";
			
			req.setAttribute("msg", msg);
			
			return "login/login";
		
		}else if(dto.getM_PW()!=M_PW && !dto.getM_PW().equals(M_PW)){
			String msg = "비밀번호가 틀립니다.";
			
			req.setAttribute("msg", msg);
			
			return "login/login";
			
		}else{
			
			//System.out.println("아이디 비번 true 반환시 보인다.");

			dto.setM_DATE(dto.getM_DATE().substring(0, 10));
			
			session.setAttribute("userInfo", dto);
			
			//MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
			//System.out.println("보낼때" + vo.getM_ID());
			
			return "loginTest";
		}
		
		
	}
	
	@RequestMapping(value="/loginTest.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginTest(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		//System.out.println("여기왔따.");
		
		//HttpSession session = req.getSession();
		
		//String userId = (String) session.getAttribute("userId");
		
		//System.out.println("세션 : " + userId);
		
		//session.setAttribute("userId", userId);
		
		return "loginTest";
	}
	
	@RequestMapping(value="/logout.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		System.out.println("로그아웃 컨트롤러");
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userInfo");
		
		return "redirect:/loginTest.action";
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
