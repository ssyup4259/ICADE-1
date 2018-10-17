package com.project.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService MailService;
	
	
	@RequestMapping(value="/sendMail.action",method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public boolean sendMail(HttpSession session, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		
		System.out.println(email);
		
		int ran = new Random().nextInt(100000) +10000;
		
		String joinCode = String.valueOf(ran);
		
		session.setAttribute("joinCode", joinCode);
		
		String subject ="회원가입 인증코드 발급 안내입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증코드는 " + joinCode + " 입니다.");
		
		System.out.println(joinCode);
		 
		return MailService.send(subject, sb.toString(), "jo42047014@gmail.com", email);
	}
}
