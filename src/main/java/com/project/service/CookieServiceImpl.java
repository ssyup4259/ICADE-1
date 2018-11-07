package com.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dao.GoodsDAO;
import com.project.dto.GoodsDTO;

@Service
public class CookieServiceImpl implements CookieService{

	@Autowired
	GoodsDAO g_dao;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	AdminService a_service;
	
	@Override
	public GoodsDTO cookieInsert(HttpServletRequest req) throws Exception {
		
		int g_num = Integer.parseInt(req.getParameter("G_NUM"));
		
		GoodsDTO g_dto = a_dao.getReadGoods(g_num);
		

		return g_dto;
		
	}

	@Override
	public HttpServletRequest cookieList(HttpServletRequest req) throws Exception {
		
		String startDate = req.getParameter("startDate");
		System.out.println(startDate + "-----------------사타타타타타타");
		List<String> c_lists = new ArrayList<String>();		
		
		c_lists = (List<String>) req.getAttribute("c_lists");
		
		List<GoodsDTO> ck_lists = new ArrayList<GoodsDTO>();
		
		int count=0;
		
		for (int i = c_lists.size(); i > 0; i--) {
				
			GoodsDTO c_dto = new GoodsDTO();
		
			if(c_lists.get(i-1).equals("change")||c_lists.get(i-1).equals("cancel")) {
				
				continue;
			}
			int c_num = Integer.parseInt(c_lists.get(i-1));
			
			c_dto = a_service.getReadGoods(c_num);
		
			ck_lists.add(c_dto);
			
			count++;
			
			if (count == 3) {
				break;
			}
				
		}
	
		req.setAttribute("ck_lists", ck_lists);
		
		return req;
		
	}


}
