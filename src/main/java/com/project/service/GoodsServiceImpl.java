package com.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

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
	
	

}
