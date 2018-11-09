package com.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SnsLoginDAO;
import com.project.dto.MemberDTO;
import com.project.dto.SnsLoginDTO;

@Service
public class SnsLoginServiceImpl implements SnsLoginService {

	@Autowired
	SnsLoginDAO sl_dao;
	
	@Override
	public SnsLoginDTO selectNaverJoin(String sns_id) throws Exception {
		return sl_dao.selectNaverJoin(sns_id);
	}

	@Override
	public void joinNaverLogin(HashMap<String, Object> hMap) throws Exception {
		sl_dao.joinNaverLogin(hMap);
	}

	@Override
	public List<String> randomIdCheck(String id) throws Exception {
		return sl_dao.randomIdCheck(id);
	}

	@Override
	public MemberDTO snsJoinCheck(String sns_id) throws Exception {
		return sl_dao.snsJoinCheck(sns_id);
	}

	@Override
	public int countMember() throws Exception {
		return sl_dao.countMember();
	}

	@Override
	public void insertNaverMember(HashMap<String, Object> hMap) throws Exception {
		sl_dao.insertNaverMember(hMap);
	}

	
	
}
