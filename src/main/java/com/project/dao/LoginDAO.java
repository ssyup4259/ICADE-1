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
	
	public MemberDTO checkInfo(String M_ID) {
		
		System.out.println("LoginDAO:" + M_ID);
		
		MemberDTO dto = new MemberDTO();
		
		System.out.println("LoginDAO:" + M_ID);
		
		dto = sessionTemplate.selectOne("loginMapper.loginChecker",M_ID);
		
		System.out.println("확인용");
		
		return dto;
		
	}

}
