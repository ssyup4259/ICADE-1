package com.project.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String loginMapper = "com.project.mybatis.loginMapper";

	@Override
	public MemberDTO checkInfo(String M_ID) throws Exception {

		MemberDTO dto = new MemberDTO();
		
		//System.out.println("LoginDAO:" + M_ID);
		
		System.out.println("-----------------------------------------------------------------" + loginMapper);
		dto = sessionTemplate.selectOne(loginMapper + ".loginChecker", M_ID);
		
		return dto;

	}
	
	
	//ID찾기
	@Override
	public String idFind(Map<String, String> map) throws Exception {
		return sessionTemplate.selectOne(loginMapper + ".idFind", map);
	}

	//비밀번호 찾기
	@Override
	public String findFind(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
