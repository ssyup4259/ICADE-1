package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.MemberDTO;

public interface LoginService {

	public MemberDTO checkInfo(HttpServletRequest request) throws Exception;
	
	//ID 찾기
	public String idFind(MemberDTO m_dto) throws Exception;
	
	//비밀번호 찾기
	public String pwdFind(MemberDTO m_dto) throws Exception;
	
}
