package com.project.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	@Override
	public MemberDTO userInfo(String M_ID) throws Exception {

		MemberDTO dto = new MemberDTO();
		
		dto = sessionTemplate.selectOne("com.project.mybatis.myPageMapper.infocheck",M_ID);
		
		return dto;

	}

	@Override
	public int pointCheck(String M_ID) throws Exception {

		int point = 0;
		
		point = sessionTemplate.selectOne("com.project.mybatis.myPageMapper.pointCheck",M_ID);
		
		return point;
	}

	@Override
	public void updateInfo(HashMap<String, Object> hMap) throws Exception {
		sessionTemplate.update("com.project.mybatis.myPageMapper.updateInfo",hMap);
	}

	@Override
	public int maxLeaveNum() throws Exception {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("com.project.mybatis.myPageMapper.maxLeaveNum");
		
		return maxNum+1;
	}

	@Override
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception {
		sessionTemplate.selectOne("com.project.mybatis.myPageMapper.copyUserData",hMap);
	}

	@Override
	public void cancelMembership(String M_ID) throws Exception {
	
		sessionTemplate.delete("com.project.mybatis.myPageMapper.cancelMembership",M_ID);
		
	}
}
