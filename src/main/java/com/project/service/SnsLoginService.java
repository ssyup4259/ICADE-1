package com.project.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dto.MemberDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;
import com.project.dto.SnsLoginDTO;

public interface SnsLoginService {

	//기존에 회원의 데이터가 들어와있다면 바로 로그인 세션처리
	public SnsLoginDTO selectNaverJoin(String sns_id) throws Exception;
	
	//네이버 로그인한 이용자의 간단 정보 입력
	public void joinNaverLogin(HashMap<String, Object> hMap) throws Exception;
	
	//랜덤 발생 아이디 중복 조회
	public List<String> randomIdCheck(String id) throws Exception;
	
	//회원가입여부체크
	public MemberDTO snsJoinCheck(String sns_id) throws Exception;
	
	//맥스넘
	public int countMember() throws Exception;
	
	//member테이블로 값 넣기
	public void insertNaverMember(HashMap<String, Object> hMap) throws Exception;
}