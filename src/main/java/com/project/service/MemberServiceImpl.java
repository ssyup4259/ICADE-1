package com.project.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;


@Service
public class MemberServiceImpl implements MemberService {

	
	
	@Autowired
	private MemberDAO m_dao;

	

	@Override
	public void insertMember(MemberDTO m_dto) throws Exception {

		
		m_dao.insertMember(m_dto);

	}

	@Override
	public int idCheck(Map<String, Object> map) throws Exception {
		return m_dao.idCheck(map);
	}

	@Override
	public int nickCheck(Map<String, Object> map) throws Exception {
		return m_dao.nickCheck(map);
	}

	/*@Override
	public int emailCheck(Map<String, Object> map) throws Exception {
		return m_dao.emailCheck(map);
	}*/




}
