package com.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MyPageDAO;
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


}
