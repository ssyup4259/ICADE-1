package com.project.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.SnsLoginDAO;
import com.project.dto.MemberDTO;
import com.project.service.SnsLoginService;

@Controller
public class SnsLoginController {
	
	@Autowired
	private SnsLoginService sl_service;
	
	@Autowired
	SnsLoginDAO sl_dao;
	
	@RequestMapping(value="/snsJoin.action", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String snslogin(
		HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String id = req.getParameter("id");
		String sns_id = req.getParameter("sns_id");
		String sns_name = req.getParameter("name");
		String sns_email = req.getParameter("email");
		System.out.println(id);
		System.out.println(sns_id);
		System.out.println(sns_name);
		System.out.println(sns_email);
		
		
		int index = sns_email.indexOf("@");
		String email_id = sns_email.substring(0,index);
		String email_domain = sns_email.substring(index+1);
		
		MemberDTO mDto = sl_service.snsJoinCheck(sns_id);
		
		//sns_id 체크해서 가입도있으면 세션 만들어서 로그인처리
		if(mDto!=null&&!mDto.equals(null)){
			HttpSession session = req.getSession();
			System.out.println("if문");
			session.setAttribute("userInfo", mDto);
			
			return "redirect:/home";
		}

		List<String> lists = sl_service.randomIdCheck(id);
		
		Iterator<String> it =  lists.iterator();
		
		System.out.println("=====================while문===================");
		while(it.hasNext()){
			String usedId = it.next();

			if(id.equals(usedId)){
				int random = (int)(Math.random() * 1000000) + 1;
				id = Integer.toString(random);
				
				return id;
			}
		}
		System.out.println("=====================while문===================");
		
		int maxNum = sl_service.countMember();
		
		String temp = "임시닉네임" + maxNum;
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("id", id);
		hMap.put("sns_id", sns_id);
		hMap.put("sns_name", sns_name);
		hMap.put("sns_email", sns_email);
		hMap.put("M_NICKNAME", temp);
		
		//sns_member 테이블로 넣기
		sl_service.joinNaverLogin(hMap);
		
		HashMap<String, Object> memberMap = new HashMap<String, Object>();
		
		memberMap.put("id", id);
		memberMap.put("sns_name", sns_name);
		memberMap.put("email_id", email_id);
		memberMap.put("email_domain", email_domain);
		memberMap.put("M_NICKNAME", temp);

		//member 테이블로 값 넣기
		sl_service.insertNaverMember(memberMap);
		
		return "login/login";
		
	}

	@RequestMapping(value="/canToken", method= {RequestMethod.GET,RequestMethod.POST})
	public String canToken(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "loginTest";
	}
	
	@RequestMapping(value="/loginTest", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginTest(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "loginTest";
	}
	
	@RequestMapping(value="/callbackTest", method= {RequestMethod.GET,RequestMethod.POST})
	public String callbackTest(MemberDTO dto, HttpServletRequest request, HttpServletResponse resp)throws Exception{
		
		return "callbackTest";
	}
	
}
