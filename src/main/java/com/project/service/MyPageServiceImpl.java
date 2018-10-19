package com.project.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MyPageDAO;
import com.project.dto.MemberDTO;

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

	

}
