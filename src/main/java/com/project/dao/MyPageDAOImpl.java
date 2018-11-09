package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

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

	@Override
	public int usedPointCheck(String M_ID) throws Exception {
		
		return sessionTemplate.selectOne("com.project.mybatis.myPageMapper.usedPointCheck",M_ID);
	}

	@Override
	public List<OrdersDTO> selectusedPointHistory(String M_ID) throws Exception {
		
		List<OrdersDTO> lists = new ArrayList<OrdersDTO>();
		
		lists = sessionTemplate.selectList("com.project.mybatis.myPageMapper.selectusedPointHistory",M_ID);
		
		return lists;
	}

	@Override
	public int selectSumTot(String O_ID) throws Exception {
		return sessionTemplate.selectOne("com.project.mybatis.myPageMapper.selectSumTot",O_ID);
	}

	@Override
	public int selectCountOnum(String O_ID) throws Exception {
		return sessionTemplate.selectOne("com.project.mybatis.myPageMapper.selectCountOnum",O_ID);
	}
}
