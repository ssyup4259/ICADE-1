package com.project.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CartDAO;
import com.project.dto.CartDTO;
import com.project.util.MyUtil;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO c_dao;
	
	@Autowired
	MyUtil myUtil;

	//장바구니 리스트
	@Override
	public HttpServletRequest cartList(HttpServletRequest req, String c_id) throws Exception {
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		
		//전체데이터갯수
		int dataCount = c_dao.getCartCount();
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CartDTO> c_lists = c_dao.getCartLists(start, end, c_id);
		
		//페이징 처리
		String listUrl = cp + "/cartList.action?c_id=" + c_id;
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("c_lists", c_lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		
		return req;
		
	}
	
	

}
