package com.project.service;

import java.util.Map;

import com.project.dto.MemberDTO;

public interface MemberService {
	
	//회원가입
	public void insertMember(MemberDTO m_dto) throws Exception;

	//아이디 중복체크
	public int idCheck(Map<String, Object> map)throws Exception;
		
	//닉네임 중복체크
	public int nickCheck(Map<String, Object> map)throws Exception;
	
	//이메일 중복체크
	//public int emailCheck(Map<String, Object> map)throws Exception;
	

	
}
