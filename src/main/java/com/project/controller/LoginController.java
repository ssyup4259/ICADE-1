package com.project.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.project.dto.WishDTO;
import com.project.service.LoginService;
import com.project.service.WishService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService l_service;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	WishService w_service;
	
	@RequestMapping(value="/login.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		return "login/login";
	}
	
	@RequestMapping(value="/login_ok.action", method=RequestMethod.POST)
	public String login_ok(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String M_ID = req.getParameter("M_ID");
		String M_PW = req.getParameter("M_PW");
		
		HttpSession session = req.getSession();
		MemberDTO dto = l_service.checkInfo(M_ID);
		
		if(dto==null || dto.equals(null)) {
			
			String msg = "아이디가 없습니다";
			
			req.setAttribute("msg", msg);
			
			return "login/login";
		
		} else if(dto.getM_PW()!=M_PW && !dto.getM_PW().equals(M_PW)){
			
			String msg = "비밀번호가 틀립니다.";
			
			req.setAttribute("msg", msg);
			
			return "login/login";
			
		} else {
			List<WishDTO> lists =new ArrayList<WishDTO>();
			
			lists =  w_service.selectWish(M_ID);
			dto.setM_DATE(dto.getM_DATE().substring(0, 10));
			
			session.setAttribute("userInfo", dto);
			session.setAttribute("wishInfo", lists);
			System.out.println("---------------------------");
			
			
			return "redirect:/";
		}
		
		
	}
	
	@RequestMapping(value="/loginTest.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginTest(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "loginTest";
	}
	
	@RequestMapping(value="/logout.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userInfo");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/find/idFind.action", method= {RequestMethod.GET})
	public String idFindForm(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "login/idFind";
		
	}
	
	@RequestMapping(value="/find/idFind.action", method= {RequestMethod.POST})
	@ResponseBody
	public String idFind(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String result = l_service.idFind(m_dto);
		
		return result;
		
	}
	
	@RequestMapping(value="/find/pwdFind.action", method= {RequestMethod.GET})
	public String pwdFindForm(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "login/pwdFind";
		
	}
	
	@RequestMapping(value="/find/pwdFind.action", method= {RequestMethod.POST})
	@ResponseBody
	public String pwdFind(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String result = l_service.pwdFind(m_dto);
		
		return result;
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
