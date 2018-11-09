package com.project.service;

import java.util.HashMap;
import java.util.List;

import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

public interface MyPageService {

	//회원정보읽어오기
	public MemberDTO userInfo(String M_ID) throws Exception;
	//포인트 조회
	public int pointCheck(String M_ID) throws Exception;
	//업데이트
	public void updateInfo(HashMap<String, Object> hMap) throws Exception;
	//탈퇴테이블에 부여할 맥스넘
	public int maxLeaveNum() throws Exception;
	//탈퇴데이터옮기기
	public void insertLeaveData(HashMap<String, Object> hMap) throws Exception;
	//탈퇴
	public void cancelMembership(String M_ID) throws Exception;
	//사용된포인트
	public int usedPointCheck(String M_ID) throws Exception;
	//사용한포인트내역
	public List<OrdersDTO> selectusedPointHistory(String M_ID) throws Exception;
	//해당 아이디의 총 주문 금액
	public int selectSumTot(String O_ID) throws Exception;
	//해당 아이디의 총 주문 횟수
	public int selectCountOnum(String O_ID) throws Exception;
	
}
