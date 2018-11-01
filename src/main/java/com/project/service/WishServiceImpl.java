package com.project.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dao.WishDAO;
import com.project.dto.GoodsDTO;
import com.project.dto.MemberDTO;
import com.project.dto.WishDTO;
import com.project.util.MyUtil;
@Service
public class WishServiceImpl implements WishService {
	@Autowired
	WishDAO w_dao;
	
	@Autowired
	AdminDAO a_dao;

	@Autowired
	MyUtil myUtil;
	
	@Override
	public HttpServletRequest wishList(HttpServletRequest req) throws Exception {
		

		HttpSession session = req.getSession();
		
		
		MemberDTO mDto = (MemberDTO) session.getAttribute("userInfo");
		
		
		String m_id;
		
		
		m_id= mDto.getM_ID();
		
	
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		
		int currentPage = 1;
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		//전체데이터갯수
		int dataCount = w_dao.dataCount();
		//전체페이지수
				int numPerPage = 2;
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);
				
				if (currentPage > totalPage)
					currentPage = totalPage;
				
				int start = (currentPage - 1) * numPerPage + 1;
				int end = currentPage * numPerPage;
		
		System.out.println("wishList ServiceImpl 까지 들어왔고");
		
		
		List<WishDTO> wishList = w_dao.wishList(start,end,m_id);
		String uri =req.getRequestURI();
		String listUrl = uri;
	
		String pageIndexList =myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("wishList",wishList);
		req.setAttribute("pageIndexList",pageIndexList);
		return req;
		
		
		
	}

	@Override
	public void wishInsert(int g_num,HttpServletRequest req) throws Exception {
		
		HttpSession info = req.getSession();
		MemberDTO m_dto = (MemberDTO) info.getAttribute("userInfo");
		
		String m_id = m_dto.getM_ID();
		
		
		GoodsDTO g_dto = new GoodsDTO();
		
		g_dto = a_dao.getReadGoods(g_num);
		
		WishDTO w_dto= new WishDTO();
		
		w_dto.setW_NAME(g_dto.getG_NAME());
		w_dto.setW_GNUM(g_num);
		w_dto.setW_SAVEFILENAME(g_dto.getG_SAVEFILENAME());
		w_dto.setW_ID(m_id);
		
		w_dao.wishInsert(w_dto);
		
		
	}

	@Override
	public int checkWish(int g_num, String m_id) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("g_num", g_num);
		map.put("m_id", m_id);
		
		return w_dao.checkCount(map);
		
	}

	@Override
	public void likeCheck(int g_num, String m_id) throws Exception {
	
		
		
		 w_dao.likeCheck(g_num,m_id);
	}

	@Override
	public void likeCheckCancel(int g_num, String m_id) throws Exception {

	
		
		 w_dao.likeCheckCancel(g_num,m_id);
	}

	@Override
	public int wCheck(int g_num, String m_id) throws Exception {

		int result =0;
		result = w_dao.wCheck(g_num, m_id);
		return result;
	}

	@Override
	public void deleteWish(int g_num, String m_id) throws Exception {
		
		w_dao.deleteWish(g_num, m_id);
	}

	@Override
	public List<WishDTO> selectWish(String M_ID) throws Exception {
		System.out.println("----------------------서비스 탓다");
		List<WishDTO> lists =new ArrayList<WishDTO>();
		lists =w_dao.selectWish(M_ID);
		 return lists;
	}


	
}
