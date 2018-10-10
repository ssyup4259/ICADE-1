package com.project.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException{
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(MemberDTO dto){
		
		sessionTemplate.insert("joinMapper.insertData", dto);
		
	}
	
	public void createAuthkey(int mAuthcode, String mEmailId){
		
		
		MemberDTO dto = new MemberDTO();
		
		sessionTemplate.update("joinMapper.createAuthkey", dto);
		
		dto.setmAuthcode(mAuthcode);
		dto.setMEmailId(mEmailId);
	}
	public void userAuth(String mEmailId) throws Exception {

		sessionTemplate.update(mEmailId);
	}

}
