package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.GoodsDAO;
import com.project.dto.GoodsDTO;
import com.project.util.MyUtil;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	GoodsDAO g_dao;
	
	@Autowired
	MyUtil myUtil;

	@Override
	public HttpServletRequest goodsMain(HttpServletRequest req) throws Exception {
		
		List<GoodsDTO> popularList = g_dao.getPopularLists();
		List<GoodsDTO> newList = g_dao.getNewLists();
		
		req.setAttribute("popularList", popularList);
		req.setAttribute("newList", newList);
		
		return req;
	}
	
	

}
