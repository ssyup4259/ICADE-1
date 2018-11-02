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
		int dataCount =  (Integer) req.getAttribute("dataCount");
		String pageIndexList = (String) req.getAttribute("pageIndexList");

	
		
		mav.addObject("wishList", wishList);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.setViewName("mypage/myPageMain");
		
		return mav;
		
	}
	@RequestMapping(value="/deleteWish.action",method= {RequestMethod.POST})
	public String deleteWish()throws Exception{
		
		return "redirect:/myPage.action" ;
		
	}
	@RequestMapping(value="/deleteAllWish.action",method= {RequestMethod.POST})
	public String deleteAllWish(int g_num ,HttpServletRequest req)throws Exception{
	
		
		
		
		
		return "redirect:/myPage.action" ;
		
	}
	
	
	@RequestMapping(value="/wishInsert.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public HashMap<String, Object> wishInsert(HttpServletRequest req,int g_num) throws Exception{
		
		HttpSession info = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		String m_id = m_dto.getM_ID();
		System.out.println("------------id체크");
		System.out.println(m_id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		int count = w_service.checkWish(g_num, m_id);//데이터가 있는지 없는지 확인
		System.out.println("------------------------------------------카운트");
		System.out.println(count);
		
		
		if(count==0) {//찜목록에 있으면
			
			w_service.wishInsert(g_num, req);
			
		}else if(count!=0) {
			
			int like_check = w_service.wCheck(g_num, m_id);//체크값 확인
			System.out.println("------------------------------------------------------------------");	
			System.out.println(like_check);
			
				
				w_service.deleteWish(g_num, m_id);
				map.put("msg", "찜목록이 삭제되었습니다.");
				map.put("like_check", 0);
				map.put("g_num", g_num);
			
		
			
			
	}
		List<WishDTO> lists = new ArrayList<WishDTO>();
		lists = w_service.selectWish(m_id);
		info.setAttribute("wishInfo",lists);
		return map;
		
	}
	
	/*	if (count > 0) { // 찜목록에 있으면
	
	w_service.likeCheckCancel(g_num, "aaa"); //체크값을 0으로 만든다.(찜을 해제한다)
	
	if(check == 0) { 
		w_service.likeCheck(g_num, "aaa");
	}
	w_service.deleteWish(g_num, "aaa");
} else if (count == 0) { //찜목록에 없으면
	
	
} else {
	w_service.wishInsert(g_num, req);
}*/
	
	
}
