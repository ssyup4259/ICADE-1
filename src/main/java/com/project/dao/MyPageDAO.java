package com.project.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;


public interface MyPageDAO {
	
	//회원정보읽어오기
	public MemberDTO userInfo(String M_ID) throws Exception;
	
	public int pointCheck(String M_ID) throws Exception;
	
	public void updateInfo(HashMap<String, Object> hMap) throws Exception;
		
	public int maxLeaveNum() throws Exception;
	
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception;
	
	public void cancelMembership(String M_ID) throws Exception;
	
	
	
}
