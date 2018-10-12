package com.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public MemberDTO checkInfo(String M_ID) { // map으로 바꿔보자
		
		MemberDTO dto = new MemberDTO();
		
		//System.out.println("LoginDAO:" + M_ID);
		
		dto = sessionTemplate.selectOne("com.project.mybatis.loginMapper.loginChecker",M_ID);
		
		//System.out.println("확인용");
		
		return dto;
		
	}

}
