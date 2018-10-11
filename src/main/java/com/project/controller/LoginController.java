package com.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.LoginDAO;
import com.project.dto.MemberDTO;

@Controller
public class LoginController {
	
	@Autowired
	LoginDAO dao;
	
	@RequestMapping(value="/login.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpServletRequest req, HttpServletResponse resp)throws Exception{

		return "login/login";
	}
	
	@RequestMapping(value="/login_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login_ok(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{

		String mId = (String) req.getParameter("mId");
		String mPw = (String) req.getParameter("mPw");
		
		System.out.println(mId);
		System.out.println(mPw);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("mId", mId);
		hmap.put("mPw", mPw);
		
		HttpSession session = req.getSession();
		
		//dto = dao.checkInfo(mId);
		
		System.out.println(dto.getMId());
		
		if(dto==null || dto.equals(null)) {
			System.out.println("dto가 널일시 뜬다.");
			
			return "login/login";
			
		}else {
			System.out.println("아이디 비번 true 반환시 보인다.");
			session.setAttribute("userId", mId);
			
			
			String userId = (String) session.getAttribute("userId");
			
			System.out.println("보낼때" + userId);
			
			return "loginTest";
		}
		
		
	}
	
	@RequestMapping(value="/loginTest.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String TestHome(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		System.out.println("여기왔따.");
		
		HttpSession session = req.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		System.out.println("세션 : " + userId);
		
		session.setAttribute("userId", userId);
		
		return "loginTest";
	}
	
	@RequestMapping(value="/logout.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userId");
		
		return "loginTest";
	}
	
	

}
