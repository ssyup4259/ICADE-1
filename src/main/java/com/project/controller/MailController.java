package com.project.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.MailService;

@Controller
public class MailController {

	private MailService mailService;

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	
	@RequestMapping(value="/mail/code.action", method = RequestMethod.POST ,produces ="application/json")
	@ResponseBody
	public boolean sendMail(HttpSession session,@RequestParam String email) {
		
		int ran = new Random().nextInt(100000) +10000;
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		
		String subject ="회원가입 인증코드 발급 안내입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증코드는 " + joinCode + " 입니다.");
		return mailService.send(subject, sb.toString(), "jo42047014@gmail.com", email, null);
				
	}
	
	
	
}
