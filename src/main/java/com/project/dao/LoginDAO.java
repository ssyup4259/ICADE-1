package com.project.dao;

import java.util.Map;

import com.project.dto.MemberDTO;

public interface LoginDAO {
	
	public MemberDTO checkInfo(String M_ID) throws Exception;
	
	//ID 찾기
	public String idFind(Map<String, String> map) throws Exception;
	
	//비밀번호 찾기
	public String pwdFind(Map<String, String> map) throws Exception;
	
	
}
