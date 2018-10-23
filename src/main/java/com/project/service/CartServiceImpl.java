package com.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CartDAO;
import com.project.dto.CartDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.util.MyUtil;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO c_dao;
	
	@Autowired
	MyUtil myUtil;
	
	//장바구니 추가
	@Override
	public void insertCartItem(String c_id, GoodsDTO g_dto, GoodsDetailDTO gd_dto) throws Exception {
		
		CartDTO c_dto = new CartDTO();
		
		String c_code = gd_dto.getGD_CODE();
		String c_name = g_dto.getG_NAME();
		int c_count = gd_dto.getGD_COUNT();
		
		c_dto.setC_ID(c_id);
		c_dto.setC_CODE(c_code);
		c_dto.setC_NAME(c_name);
		c_dto.setC_COUNT(c_count);
		
		c_dao.insertCartItem(c_dto);
		
	}

	//장바구니 리스트
	@Override
	public HttpServletRequest cartList(HttpServletRequest req, String c_id) throws Exception {
		
		String cp = req.getContextPath();
		String message = req.getParameter("message");
		if (req.getParameter("message") == null || req.getParameter("message").equals("")) {
			
		} else {
			message = URLDecoder.decode(req.getParameter("message"), "UTF-8");
		}
		
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		
		//전체데이터갯수
		int dataCount = c_dao.getCartCount(c_id);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<CartDTO> c_lists = c_dao.getCartLists(start, end, c_id);
		
		//페이징 처리
		String listUrl = cp + "/cart/cartList.action?c_id=" + c_id;
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("c_lists", c_lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("message", message);
		
		return req;
		
	}
	
	
	//장바구니 개별 비우기
	@Override
	public String deleteCartItem(int c_num, String pageNum) throws Exception {
		c_dao.deleteCartItem(c_num, pageNum);
		return pageNum;
	}

	//장바구니 모두 비우기
	@Override
	public void deleteCartAll(String c_id) throws Exception {
		c_dao.deleteCartAll(c_id);
	}

	//장바구니 수량 수정
	@Override
	public void updateCartItem(String c_code, int c_count) throws Exception {
		
		c_dao.updateCartItem(c_code, c_count);
		
	}


	@Override
	public CartDTO getCartItem(String c_num) throws Exception {
		return c_dao.getCartItem(c_num);
	}

}
