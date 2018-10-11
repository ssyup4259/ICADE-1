package com.project.service;

import com.project.dto.MemberDTO;

public interface MemberService {
	
	//회원가입
	public void insertMember(MemberDTO m_dto) throws Exception;
	
	
}
