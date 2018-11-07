package com.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;


public interface MyPageDAO {
	
	//회원정보읽어오기
	public MemberDTO userInfo(String M_ID) throws Exception;
	
	public int pointCheck(String M_ID) throws Exception;
	
	public void updateInfo(HashMap<String, Object> hMap) throws Exception;
	
	public int maxLeaveNum() throws Exception;
	//탈퇴데이터옮기기
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception;
	//탈퇴
	public void cancelMembership(String M_ID) throws Exception;
	//사용된포인트
	public int usedPointCheck(String M_ID) throws Exception;
	//사용한포인트내역
	public List<OrdersDTO> selectusedPointHistory(String M_ID) throws Exception;
	
}
