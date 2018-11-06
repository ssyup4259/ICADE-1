package com.project.service;

import java.util.HashMap;
import java.util.List;

import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

public interface MyPageService {

	public MemberDTO userInfo(String M_ID) throws Exception;
	
	public int pointCheck(String M_ID) throws Exception;
	
	public void updateInfo(HashMap<String, Object> hMap) throws Exception;
	
	public int maxLeaveNum() throws Exception;
	
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception;
		
	public void cancelMembership(String M_ID) throws Exception;
	
	public int usedPointCheck(String M_ID) throws Exception;
	//사용한포인트내역
	public List<OrdersDTO> selectusedPointHistory(String M_ID) throws Exception;
	
}
