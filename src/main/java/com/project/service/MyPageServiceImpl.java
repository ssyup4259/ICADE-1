package com.project.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.project.dao.MyPageDAO;
import com.project.dao.WishDAO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO my_dao;
	
	@Override
	public MemberDTO userInfo(String M_ID) throws Exception {
		return my_dao.userInfo(M_ID);
	}

	@Override
	public int pointCheck(String M_ID) throws Exception {
		return my_dao.pointCheck(M_ID);
	}

	@Override
	public void updateInfo(HashMap<String, Object> hMap) throws Exception {
		my_dao.updateInfo(hMap);
		
	}

	@Override
	public int maxLeaveNum() throws Exception {
		return my_dao.maxLeaveNum();
	}

	@Override
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception {
		my_dao.insertLeaveData(hMap);
	}
	
	@Override
	public void cancelMembership(String M_ID) throws Exception {
		my_dao.cancelMembership(M_ID);
	}

	@Override
	public int usedPointCheck(String M_ID) throws Exception {
		return my_dao.usedPointCheck(M_ID);
	}

	@Override
	public List<OrdersDTO> selectusedPointHistory(String M_ID) throws Exception {
		return my_dao.selectusedPointHistory(M_ID);
	}

	@Override
	public int selectSumTot(String O_ID) throws Exception {
		return my_dao.selectSumTot(O_ID);
	}

	@Override
	public int selectCountOnum(String O_ID) throws Exception {
		return my_dao.selectCountOnum(O_ID);
	}

	@Override
	public HttpServletRequest myPageMain(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		
		MemberDTO vo = new MemberDTO();
		
		vo = (MemberDTO) session.getAttribute("userInfo");

		String M_ID = vo.getM_ID();
		
		int point = my_dao.pointCheck(M_ID);
		
		int o_Tot = my_dao.selectSumTot(M_ID);
		int SellCount = my_dao.selectCountOnum(M_ID);
		
		int usedPoint = my_dao.usedPointCheck(M_ID);
		String jsonM_id = new Gson().toJson(M_ID);
		
		request.setAttribute("SellCount", SellCount);
		request.setAttribute("usedPoint", usedPoint);
		request.setAttribute("jsonM_id", jsonM_id);
		request.setAttribute("o_Tot", o_Tot);
		request.setAttribute("point", point);
		
		return request;
	}

	@Override
	public HttpServletRequest infoCheckPage(HttpServletRequest request) throws Exception {

		
		
		return request;
	}


}
