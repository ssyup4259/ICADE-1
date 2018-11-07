package com.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.service.LoginService;

@Controller
public class SnsLoginController {
	
	@Autowired
	private LoginService l_service;
	
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value="/snslogin.action", method= {RequestMethod.POST})
	@ResponseBody
	public String snslogin(@RequestBody Map<String, Object> params, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		System.out.println("==================================================================55555555555555555555555====================================");
		String id = (String) params.get("id");
		System.out.println(id);
		String email = (String) params.get("email");
		System.out.println(email);
		String name = (String) params.get("name");
		System.out.println(name);
		String sns_id = (String) params.get("sns_id");
		System.out.println(sns_id);
		
		return "성공";
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
