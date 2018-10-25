package com.project.service;

import com.project.dto.MemberDTO;

public interface LoginService {

	public MemberDTO checkInfo(String M_ID) throws Exception;
	
	//ID 찾기
	public String idFind(MemberDTO m_dto) throws Exception;
	
	//비밀번호 찾기
	public String pwdFind(MemberDTO m_dto) throws Exception;
	
}
