package com.project.dao;

import java.util.Map;

import com.project.dto.MemberDTO;

public interface MemberDAO {
	
	//회원가입
	public void insertMember(MemberDTO m_dto)throws Exception;

	//아이디 중복체크
	public int idCheck(Map<String, Object> map)throws Exception;
	
	//닉네임 중복체크
	public int nickCheck(Map<String, Object> map)throws Exception;
	//public int nickCheck(String M_ID)throws Exception;
	
	//이메일 중복체크
	public int emailCheck(Map<String, Object> map) throws Exception;
	
}
