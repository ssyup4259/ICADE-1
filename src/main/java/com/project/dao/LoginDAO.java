package com.project.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class LoginDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public boolean checkInfo(HashMap<String, Object> hmap ) {
		
		boolean checker = sessionTemplate.selectOne("loginMapper.loginChecker", hmap);
		
		return checker;
		
	}

}
