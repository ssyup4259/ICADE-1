package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;


@Controller
public class MemberController {

	@Autowired
	MemberDAO m_dao;
	
	@RequestMapping(value="/join.action")
	public ModelAndView join() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/join");
		
		return mav;
	}
	
	@RequestMapping(value="/join_ok.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String join_ok(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		m_dao.insertData(dto);
		
		
		return "redirect:/list.action";
	}


}
