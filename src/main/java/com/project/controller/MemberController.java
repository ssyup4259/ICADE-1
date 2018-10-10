package com.project.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import com.project.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	MemberDAO m_dao;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService service; 
	
	@RequestMapping(value="/join.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String join(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("aaa");
		
		return "member/join";
	}
	
	@RequestMapping(value="/join_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String join_ok(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		m_dao.insertData(dto);
		
		
		return "redirect:/list.action";
	}
	@RequestMapping(value="/emailcheck",method= RequestMethod.POST)
	public String emailCheck(MemberDTO dto, Model model, RedirectAttributes rttr, HttpServletRequest req, HttpSession session)throws Exception{
		
		logger.info("회원가입...");
		logger.info(dto.toString());
		service.insertData(dto);
		rttr.addFlashAttribute("authmsg" , "가입시 사용한 이메일로 인증해주세요");
		return "redirect:/";
		
		
	}
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String mEmailId, Model model) throws Exception { // 이메일인증
		service.userAuth(mEmailId);
		model.addAttribute("user_email", mEmailId);

		return "/user/emailConfirm";
	}


}
