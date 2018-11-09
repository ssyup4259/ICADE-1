package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.MemberDTO;
import com.project.dto.WishDTO;
import com.project.service.WishService;

@Controller
@RequestMapping("/wish/*")
public class WishController {
	
	@Autowired
	WishService w_service;
	
	
	@RequestMapping(value="/wishList.action",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView wishList(HttpServletRequest req) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		req =w_service.wishListList(req);
		List<WishDTO> wishList = (List<WishDTO>) req.getAttribute("wishList");
		int dataCount =  (Integer) req.getAttribute("cookieDataCount");
		String pageIndexList = (String) req.getAttribute("pageIndexList");

	
		
		mav.addObject("wishList", wishList);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.setViewName("mypage/myPageMain");
		return mav;
		
	}
	@RequestMapping(value="/deleteWish.action",method= {RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> deleteWish(HttpServletRequest req,int G_NUM)throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		int g_num =G_NUM;
	
		System.out.println("------------------------------");
		System.out.println(g_num);
		HttpSession info = req.getSession();
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		String m_id = m_dto.getM_ID();
		
		String g_name=w_service.oneWish(g_num);
		map.put("G_NUM",g_num);
		map.put("G_NAME",g_name);
		w_service.deleteWish(g_num, m_id);
		return map ;
		
	}
	@RequestMapping(value="/deleteAllWish.action",method= {RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> deleteAllWish(HttpServletRequest req)throws Exception{
		System.out.println("------------------111111111111111");
		HashMap<String, Object> map =new HashMap<String, Object>();
		HttpSession info = req.getSession();
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		System.out.println("------------------222222222222222222");
		String m_id = m_dto.getM_ID();
		System.out.println(m_id);
		int idDataCount=w_service.idDataCount(m_id);
		System.out.println("------------------3333333333333333");
		System.out.println(idDataCount);
		if(idDataCount !=0) {
		w_service.deleteAllWish(m_id);
		map.put("msg","찜목록이 삭제되었습니다");
		
		}else {
		map.put("msg","찜목록이 없습니다");	
			
		}
		
		
		return map;
		
	}
	@RequestMapping(value="/wishCheck.action",method= {RequestMethod.POST})
	@ResponseBody
	public HashMap<String, Object> wishCheck(HttpServletRequest req,int G_NUM)throws Exception{
		
		HttpSession info = req.getSession();
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		String m_id = m_dto.getM_ID();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int count = w_service.checkWish(G_NUM, m_id);//데이터가 있는지 없는지 확인
		map.put("count",count);
		map.put("G_NUM",G_NUM);
		
		return map;
		
	}
	
	
	@RequestMapping(value="/wishInsert.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public HashMap<String, Object> wishInsert(HttpServletRequest req,int g_num) throws Exception{
		
		HttpSession info = req.getSession();
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		String m_id = m_dto.getM_ID();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		int count = w_service.checkWish(g_num, m_id);//데이터가 있는지 없는지 확인
		
		if(count==0) {//찜목록에 있으면
			
			w_service.wishInsert(g_num, req);
			
			map.put("msg", "찜목록이 추가되었습니다.");
			map.put("g_num", g_num);
			map.put("like_check",1);
			
		}else if(count!=0) {
			
			
				
				map.put("msg", "찜목록이 삭제되었습니다.");
				map.put("g_num", g_num);
				w_service.deleteWish(g_num, m_id);
				map.put("like_check",0);
			
		
			
			
	}
		List<WishDTO> lists = new ArrayList<WishDTO>();
		lists = w_service.selectWish(m_id);
		info.setAttribute("wishInfo",lists);
		return map;
		
	}

	
}
