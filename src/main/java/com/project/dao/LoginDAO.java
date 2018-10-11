package com.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class LoginDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public MemberDTO checkInfo(String mId) {
		
		System.out.println("LoginDAO:" + mId);
		
		MemberDTO dto = new MemberDTO();
		
		dto = sessionTemplate.selectOne("loginMapper.loginChecker",mId);
		
		System.out.println("확인용");
		
		return dto;
		
	}

}
