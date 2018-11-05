package com.project.service;

import java.util.HashMap;

import com.project.dto.MemberDTO;

public interface MyPageService {

	public MemberDTO userInfo(String M_ID) throws Exception;
	
	public int pointCheck(String M_ID) throws Exception;
	
	public void updateInfo(HashMap<String, Object> hMap) throws Exception;
	
	public int maxLeaveNum() throws Exception;
	
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception;
		
	public void cancelMembership(String M_ID) throws Exception;
	
	public int usedPointCheck(String M_ID) throws Exception;
	
}
