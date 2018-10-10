package com.project.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.MemberDTO;

public class MemberDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}

	public void insertData(MemberDTO dto) {
		sessionTemplate.insert("joinMapper.insertData", dto);
	}

}
