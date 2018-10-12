package com.project.dao;

import java.sql.SQLException;
import java.util.Map;

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

		System.out.println(m_dto);
		sessionTemplate.insert(namespace + ".insertMember", m_dto);

	}

	@Override
	public int idCheck(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = sessionTemplate.selectOne(namespace + ".idCheck", map);

		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));

		return result;
	}

	@Override
	public int nickCheck(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = sessionTemplate.selectOne(namespace + ".nickCheck", map);

		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));

		return result;
	}

}
