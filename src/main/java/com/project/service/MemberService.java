package com.project.service;

import com.project.dto.MemberDTO;

public interface MemberService {
	
	//회원가입
	public int insertMember(MemberDTO m_dto) throws Exception;

	//아이디 중복
	public int idCheck(String M_ID) throws Exception;
	public int nickCheck(String M_NICKNAME) throws Exception;
	
	
}
