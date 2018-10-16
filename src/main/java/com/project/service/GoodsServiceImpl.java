package com.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dao.GoodsDAO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsKindDTO;
import com.project.util.MyUtil;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	GoodsDAO g_dao;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	MyUtil myUtil;

	@Override
	public HttpServletRequest goodsMain(HttpServletRequest req) throws Exception {
		
		List<GoodsDTO> popularList = g_dao.getPopularLists();
		List<GoodsDTO> newList = g_dao.getNewLists();
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("popularList", popularList);
		req.setAttribute("newList", newList);
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
	}
	
	

	@Override
	public HttpServletRequest goodsList(HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if (searchKey == null) {
			
			searchKey = "G_NAME";
			searchValue = "";
			
		} else {
			
			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = g_dao.getGoodsCount(searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 16;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		String gdKindNum = req.getParameter("GK_KIND_NUM");
		
		if (gdKindNum == null || gdKindNum.equals("")) {
			gdKindNum = "";
		}
		
		List<GoodsDTO> g_lists = g_dao.goodsList(start, end, gdKindNum, searchKey, searchValue);
		
		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "gdKindNum=" + gdKindNum;
			param = "&searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/goodsList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/goodsDetail.action?pageNum=" + currentPage;
			
		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("g_lists", g_lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("articleUrl",articleUrl);
		req.setAttribute("gdKindNum", gdKindNum);
		
		return req;
	}
	
	
	@Override
	public GoodsDTO imageTest(HttpServletRequest req) throws Exception {
		
		int g_num = Integer.parseInt(req.getParameter("g_num"));
		
		GoodsDTO g_dto = a_dao.getReadGoods(g_num);
		
		return g_dto;
	}
	
	
	public HttpServletRequest cookieTest(Cookie[] cookies, HttpServletRequest req) throws Exception {
		
		int clength = 0;
		
		if (cookies != null) {
			clength = cookies.length;
		}
		
		String[] cookieName =  new String[clength];
		String[] cookieValue = new String[clength];
		
		Cookie ck = null;
		
		if(cookies != null) {
		     for (int i = 0; i < clength; i++) {
		    	 
		    	 GoodsDTO g_dto = new GoodsDTO();
		    	 
		         ck = cookies[i];		         
		         
		         cookieName[i] = ck.getName();
		         cookieValue[i] = ck.getValue();
		      }
		}
		
		req.setAttribute("cookies", cookies);
		req.setAttribute("clength", clength);
		req.setAttribute("cookieName", cookieName);
		req.setAttribute("cookieValue", cookieValue);
		
		return null;
		
	}

}
