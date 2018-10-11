package com.project.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String namespace = "com.project.mybatis.joinMapper";
	
	@Override
	public void insertMember(MemberDTO m_dto) throws Exception {

		sessionTemplate.insert(namespace +".insertMember", m_dto);

	}

	@Override
	public int idCheck(String M_ID) throws Exception {

		return sessionTemplate.selectOne(namespace+".idCheck", M_ID);
		
		
	}

	@Override
	public int nickCheck(String M_NICKNAME) throws Exception {
		
		return sessionTemplate.selectOne(namespace+".nickCheck", M_NICKNAME);
		
		
	}

}
