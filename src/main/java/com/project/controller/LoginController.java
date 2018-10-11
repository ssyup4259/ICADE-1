package com.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dao.LoginDAO;
import com.project.dto.MemberDTO;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{

		
		return "loginTest";
	}
	
	@RequestMapping(value="/login_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login_ok(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{

		String mId = (String) req.getAttribute("mId");
		String mPw = (String) req.getAttribute("mPw");
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("mId", mId);
		hmap.put("mPw", mPw);
		
		LoginDAO dao = new LoginDAO();
		
		if(dao.checkInfo(hmap)) {
			System.out.println("아이디 비번 true 반환시 보인다.");
		}
		
		return "home";
	}

}
