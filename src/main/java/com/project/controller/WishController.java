package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.MemberDTO;
import com.project.service.WishService;

@Controller
@RequestMapping("/wish/*")
public class WishController {
	
	@Autowired
	WishService w_service;
	
	@RequestMapping(value="/wishList.action",method= {RequestMethod.GET})
	public String wishList(HttpServletRequest req) throws Exception{
		
		System.out.println("===================wishList.action 부분 들어왔나 체크용================================");
		
		w_service.wishList(req);
		
		
		
		return "wish/wish";
		
	}
	
	@RequestMapping(value="/wishInsert.action",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public HashMap<String, Object> wishInsert(HttpServletRequest req,int g_num) throws Exception{
		
		
		
		
		
		/*HttpSession info = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		String m_id = m_dto.getM_ID();
		*/
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		int count = w_service.checkWish(g_num, "aaa");//데이터가 있는지 없는지 확인
		
		
		
		
		if(count==0) {//찜목록에 있으면
			
			w_service.wishInsert(g_num, req);
			
		}else if(count!=0) {
			
			int like_check = w_service.wCheck(g_num, "aaa");//체크값 확인
			System.out.println("------------------------------------------------------------------");	
			System.out.println(like_check);
			
			if(like_check !=0) {
				w_service.likeCheckCancel(g_num, "aaa");
				map.put("msg", "찜목록에 추가되었습니다.");
				map.put("like_check", like_check);
				map.put("g_num", g_num);
				
			}else if(like_check ==0){
				
				w_service.likeCheck(g_num, "aaa");
				map.put("msg", "찜목록이 삭제되었습니다.");
				map.put("like_check", like_check);
				map.put("g_num", g_num);
			
		}
			
			
	}

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
