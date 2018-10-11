package com.project.service;

import com.project.dto.MemberDTO;

public interface MemberService {
	
	//회원가입
	public void insertMember(MemberDTO m_dto) throws Exception;
	
	//아이디 중복체크
	public int idCheck(String M_ID)throws Exception;
		
	//닉네임 중복체크
	public int nickCheck(String M_NICKNAME)throws Exception;
	
}
